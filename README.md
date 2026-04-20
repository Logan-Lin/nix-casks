Stripped-down fork of [atahanyorganci/nix-casks](https://github.com/atahanyorganci/nix-casks) for personal use.

Fetches Homebrew cask metadata directly from the [Homebrew API](https://formulae.brew.sh/docs/api/) and generates Nix derivations for a curated set of macOS apps. A daily CI job keeps `packages.json` up to date.

## Usage

```nix
# flake.nix
inputs.nix-casks.url = "github:Logan-Lin/nix-casks";
```

Add or remove casks by editing `casks.txt`.
