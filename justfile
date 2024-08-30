play:
  @ansible-playbook --vault-password-file password -K site.yml

encrypt path:
  @ansible-vault encrypt --vault-password-file password {{path}}

decrypt path:
  @ansible-vault decrypt --vault-password-file password {{path}}