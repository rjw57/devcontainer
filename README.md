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

For the moment, releases are performed manually by running the [Release action][release-action].

[release-action]: https://github.com/rjw57/devcontainer/actions/workflows/release.yml

## CI Actions

An *ad hoc* build can be performed by manually triggering the container image build and push action.
