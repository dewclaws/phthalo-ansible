# Azur's lab playbook

This is a really simple playbook to harden my server(s) and install necessary packages.
There's also a role to set up my media server, Phthalo.

## Prerequisites

  * ⭐️ Initial setup for a freshly-installed Debian machine, via passworded SSH:
    ```bash
      # Install and configure sudo from the root user
      su -
      apt-get install sudo
      usermod -aG sudo <you>
      exit

      # My password manager handles my SSH key,
      # but I have to copy it to new hosts manually
      # ...for whatever reason
      mkdir ~/.ssh
      vi ~/.ssh/authorized_keys
      ```
  * 📼 Phthalo-specific setup:
    1. **Run `just init-hosts` first**
    2. If the ZFS pool has been nuked for whatever reason, that's no good. You'll need to create it.
      ```bash
      sudo zpool create \
        # mountpoint
        -m /mnt/storage \
        # pool name
        storage \
        # pool mode
        mirror \
        <disks, space separated>
      ```
    3. If the pool just needs to be imported, great!
      ```bash
      sudo zpool import storage
      ```
    4. Configure ownership of the mount.
      ```bash
      sudo chown -R media:media /mnt/storage
      sudo chmod -R 770 /mnt/storage
      ```

## Running the playbook

Ensure [`just`](https://github.com/casey/just) is installed. Failing that, you can always check the [`justfile`](justfile) for the commands it would normally run.

### Available recipes

  * `just galaxy-pull`
    * Installs Ansible Galaxy roles that might not be on your control node
    * Run this once to pull role dependencies
  * `just init-hosts`
    * Bootstraps hosts, hardening security and installing required packages
    * Only needs to be run once, usually
  * `just media-deploy`
    * Deploys (or re-deploys) Docker containers for the media server
    * Run any time the container topology or a configuration changes