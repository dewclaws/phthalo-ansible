play:
  @ansible-playbook --vault-password-file password -K site.yml

docker-switch:
  @ansible-playbook --vault-password-file password -K site.yml --tags docker --skip-tags initial

encrypt path:
  @ansible-vault encrypt --vault-password-file password {{path}}

decrypt path:
  @ansible-vault decrypt --vault-password-file password {{path}}