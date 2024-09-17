init-hosts:
  @ansible-playbook site.yml -K --tags "init"

deploy-unifi:
  @ansible-playbook site.yml -K --tags "unifi"

galaxy-pull:
  @ansible-galaxy install -r requirements.yml

media-deploy:
  @ansible-playbook site.yml -K --tags "media-deploy"
