# Development environment container

A container which is pre-configured with my preferred developer environment.

## Developing

Install [prek][prek] hooks:

```sh
prek install
```

[prek]: https://prek.j178.dev/

Build locally via:

```sh
podman build --security-opt=label=disable --tag localhost/devenv ./container
```

> [!NOTE]
>
> The `--security-opt=label=disable` is required for distros like Fedora with SELinux profiles which
> restrict access to the home directory.

## Releasing

For the moment, releases are performed manually by running `release-it` locally until we can work
out a good way of triggering image builds:

```console
npx --package=@release-it/conventional-changelog \
    --package=@release-it/bumper \
    --package=release-it \
    release-it
```
