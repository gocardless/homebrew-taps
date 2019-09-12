# frozen_string_literal: true

class ExposeSshAgentToDocker < Formula
  desc "Service that exposes your local SSH agent for use during docker builds - see the with-host-agent script in the GC base image"
  homepage "https://github.com/gocardless/base"
  url "file:///dev/null"
  version "0.0.1"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "socat"

  # Homebrew raises an exception if you don't install any files. We install a
  # dummy one so it doesn't complain.
  #
  # The only thing we care about in this formula is the plist below that
  # creates the entry we want in brew services.
  def install
    system "/usr/bin/touch", "expose-ssh-agent-to-docker-dummy-bin"
    bin.install "expose-ssh-agent-to-docker-dummy-bin"
  end

  # Starts an instance of socat that exposes your local SSH agent on a TCP port
  # bound only to the loopback interface.
  #
  # The command is wrapped in bash so that the SSH_AUTH_SOCK environment
  # variable can be interpolated.
  #
  # We use this in Docker builds. See the with-host-agent script in
  # https://github.com/gocardless/base
  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>/bin/bash</string>
        <string>-c</string>
        <string>exec /usr/local/bin/socat tcp4-listen:24249,bind=127.0.0.1,reuseaddr,fork unix:${SSH_AUTH_SOCK}</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>WorkingDirectory</key>
      <string>#{HOMEBREW_PREFIX}</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/expose-ssh-agent-to-docker.log</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/expose-ssh-agent-to-docker.log</string>
    </dict>
    </plist>
  EOS
  end
end
