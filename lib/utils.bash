#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/boltops-tools/terraspace/tags"
TOOL_NAME="terraspace"
TOOL_TEST="terraspace --version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if terraspace is not hosted on GitHub releases.
# if [ -n "${GITHUB_API_TOKEN:-}" ]; then
#   curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
# fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//'
}

# install_version() {
# gem install terraspace -v $version
# }

# # This function probably isn't needed if running through ruby
# download_release() {
#   local version filename url
#   version="$1"
#   filename="$2"

#   url="$GH_REPO/archive/refs/tags/v${version}.tar.gz"

#   echo "* Downloading $TOOL_NAME release $version..."
#   curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
# }

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    echo "creating directory"
    mkdir -p "$install_path"

    echo "DL_PATH = $ASDF_DOWNLOAD_PATH"
    echo "INS_PATH = $install_path" 
    cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

    # TODO: Asert terraspace executable exists.
    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    # Change this to something like...

    # gem install terraspace -v 1.0.6

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}

install_terraspace() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  (
    gem install $TOOL_NAME -v $version
    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
