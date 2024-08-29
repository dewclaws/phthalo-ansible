# Azur's lab playbook

This is an Ansible playbook that sets up my home server with the packages, docker containers, and ZFS provisioning for my needs.

Currently it runs on a single host, as that's all I need it to do.

## Variables

Variables that you may want to change:
  * `group_vars/all.yml`
    * `ssh_pk`: the public key you want to be copied to all hosts
  * `host_vars/*.yml`
    * `timezone`: the timezone explicitly defined for most Docker containers
    * `media_zfs_pool_mode`: the [vdev mode](https://openzfs.github.io/openzfs-docs/man/master/7/zpoolconcepts.7.html#Virtual_Devices_(vdevs)) to specify for the media ZFS pool
    * `media_zfs_pool_devices`: a list of disk ID's to be part of the media ZFS pool

## Assumptions
This playbook works given the following prerequisites:
  * Debian 12 is installed on the target machine
  * The administrative user (not root) allows public key authentication and `sudo` is available

## Run
Ensure [`just`](https://github.com/casey/just) is installed.

```bash
$ just play
```