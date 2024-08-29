play:
  @ansible-playbook --vault-password-file enc_pass -K main.yml

encrypt path:
  @ansible-vault encrypt --vault-password-file enc_pass {{path}}

decrypt path:
  @ansible-vault decrypt --vault-password-file enc_pass {{path}}