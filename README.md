# Azur's lab playbook

This is an Ansible playbook that sets up my home server with the packages, docker containers, and ZFS provisioning for my needs.

Currently it runs on a single host, as that's all I need it to do.

## Assumptions

  * This playbook was written to support **Debian 12**
  * It is meant to be run on a freshly-installed machine with:
    * `sudo` installed, and available to your remote user(s)
  * **You should have a `password` file** with an encryption password for the default container configs

## Variables

Variables that you may want to change:
  * `group_vars/all.yml`
    * `ssh_pk`: the public key you want to be copied to all hosts
  * `host_vars/*.yml`
    * `timezone`: the timezone explicitly defined for most Docker containers
    * `media_zfs_pool_mode`: the [vdev mode](https://openzfs.github.io/openzfs-docs/man/master/7/zpoolconcepts.7.html#Virtual_Devices_(vdevs)) to specify for the media ZFS pool
    * `media_zfs_pool_devices`: a list of disk IDs to be part of the media ZFS pool

## Run
Ensure [`just`](https://github.com/casey/just) is installed. It's a useful shorthand package so I don't have to type long commands every time.

```bash
# List available recipes
$ just -l

# Main play command (`play` can be omitted)
$ just play
```

Failing that, you can always check the [`justfile`](justfile) for the commands it would normally run.