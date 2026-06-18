Stripped-down fork of [atahanyorganci/nix-casks](https://github.com/atahanyorganci/nix-casks) for personal use.

Fetches Homebrew cask metadata directly from the [Homebrew API](https://formulae.brew.sh/docs/api/) and generates Nix derivations for a curated set of macOS apps.
The `master` branch holds the hand-maintained source.
A daily CI job regenerates `packages.json` and commits it to the `archive` branch, so consume the flake from `archive` to get the latest metadata.

## Usage

```nix
# flake.nix
inputs.nix-casks.url = "github:Logan-Lin/nix-casks/archive";
```

Add or remove casks by editing `casks.txt` on `master`.
