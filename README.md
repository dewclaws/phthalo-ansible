# Azur's lab playbook

This is an Ansible playbook that sets up my home server with the packages, docker containers, and ZFS provisioning for my needs.

Currently it runs on a single host, as that's all I need it to do.

## Assumptions
This playbook works given the following prerequisites:
  * Debian 12 is installed on the target machine
  * The administrative user (not root) allows public key authentication and `sudo` is available

## Run
Ensure [`just`](https://github.com/casey/just) is installed.

```bash
$ just play
```