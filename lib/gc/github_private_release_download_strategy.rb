# frozen_string_literal: true

module Gc
  class GithubPrivateReleaseDownloadStrategy < CurlDownloadStrategy
    require "utils/formatter"
    require "utils/github"

    # These arguments are all bound to instance variables by the super's initialize.
    def initialize(url, name, version, **meta)
      super
      parse_url_pattern
      set_github_token
      set_headers
      set_url
    end

    private

    def parse_url_pattern
      url_pattern = %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
      unless @url&.match?(url_pattern)
        raise CurlDownloadStrategyError, "Invalid url pattern for GitHub Release."
      end

      _, @owner, @repo, @tag, @filename = *@url.match(url_pattern)
    end

    def set_github_token
      @github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
      unless @github_token
        raise CurlDownloadStrategyError,
              "Environment variable HOMEBREW_GITHUB_API_TOKEN is required."
      end

      validate_github_repository_access!
    end

    def set_url
      @url = "https://#{@github_token}@api.github.com/repos/#{@owner}/#{@repo}/" \
            "releases/assets/#{asset_id}"
    end

    def set_headers
      @meta[:headers] ||= []
      @meta[:headers] << "Accept: application/octet-stream"
    end

    def validate_github_repository_access!
      # Test access to the repository
      GitHub.repository(@owner, @repo)
    rescue GitHub::API::HTTPNotFoundError
      # We only handle HTTPNotFoundError here,
      # because AuthenticationFailedError is handled within util/github.
      message =
        "HOMEBREW_GITHUB_API_TOKEN can not access the repository: #{@owner}/#{@repo}" \
        "This token may not have permission to access the repository or the url of" \
        "the formula may be incorrect."
      raise CurlDownloadStrategyError, message
    end

    def asset_id
      release_metadata = fetch_release_metadata
      asset = release_metadata["assets"].find { |a| a["name"] == @filename }
      raise CurlDownloadStrategyError, "Asset file not found." if asset.nil?

      asset["id"]
    end

    def fetch_release_metadata
      release_url = "https://api.github.com/repos/#{@owner}/#{@repo}/" \
                    "releases/tags/#{@tag}"
      GitHub::API.open_rest(release_url)
    end
  end
end
