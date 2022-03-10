<div align="center">

# asdf-terraspace [![Build](https://github.com/dcdarrell9/asdf-terraspace/actions/workflows/build.yml/badge.svg)](https://github.com/dcdarrell9/asdf-terraspace/actions/workflows/build.yml) [![Lint](https://github.com/dcdarrell9/asdf-terraspace/actions/workflows/lint.yml/badge.svg)](https://github.com/dcdarrell9/asdf-terraspace/actions/workflows/lint.yml)


[terraspace](https://terraspace.cloud/docs/intro/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add terraspace
# or
asdf plugin add terraspace https://github.com/dcdarrell9/asdf-terraspace.git
```

terraspace:

```shell
# Show all installable versions
asdf list-all terraspace

# Install specific version
asdf install terraspace latest

# Set a version globally (on your ~/.tool-versions file)
asdf global terraspace latest

# Now terraspace commands are available
terraspace --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/dcdarrell9/asdf-terraspace/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Darrell Cox](https://github.com/dcdarrell9/)
