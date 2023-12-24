# Root access with `--accept-flake-config` and `post-build-hook`

With Nix Flakes, the [`nixConf = { accept-flake-config = true;};`][accept-flake-config] setting is
equivalent to `root` access when combined with the
[`post-build-hook`][post-build-hook] setting. (At least on multi-user Nix
installs, which run builds through the Nix daemon.)

```ShellSession
$ nix build --print-build-logs
my-cool-and-normal-derivation (post)> root
```

[post-build-hook]: https://nixos.org/manual/nix/unstable/command-ref/conf-file.html#conf-post-build-hook
[accept-flake-config]: https://nixos.org/manual/nix/unstable/command-ref/conf-file.html#conf-accept-flake-config
