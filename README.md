# Homebrew-taps

> A collection of internal taps used by GoCardless

## Upgrading Formula version

1. Get the latest release URL for the library you want to upgrade. 
Example:
`https://github.com/gocardless/crank/releases/latest`

2. Update the `release` value in the `url`.

3. Generate a checksum for release files. **Note:** Some releases already contain a file
with checksums. If that is the case the checksum should be obtained from there. Otherwise
follow the steps below.

   1. Download the required file using the URL from Step 1.

   2. Calculate its SHA256 by running:

    ```console
    $ shasum -a 256 <name_of_the_file>
    ```

5. Update the `sha256` value in the Formula file.

**Note:** If the Formula has operating systems dependent versions, the 
hash needs to be calculated for each of them.

### Testing the upgrade

Make sure to test if the Formula has been upgraded properly:
```console
brew install Formula/crank.rb
```
