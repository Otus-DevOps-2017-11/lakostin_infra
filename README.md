# lakostin_infra

1. ssh -At appuser@35.205.147.90 ssh 10.132.0.3
2. touch ~/.ssh/config; chmod 600 ~/.ssh/config
 config file is attached
 'ssh internalhost' works
3. bastion ip: 35.205.147.90 int.ip: 10.132.0.2
   someinternalhost 	     int.ip: 10.132.0.3

## HW06

```gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure```

*1 attached create_instance_with_startup.sh

```gcloud compute instances create reddit-app2 --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup.sh```

*2 attached create_fw_rule.sh and delete_fw_rule.sh

```gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --target-tags=puma-server --source-ranges=0.0.0.0/0```

```gcloud compute firewall-rules delete default-puma-server```

## HW07

```packer.io build -var-file=variables.json ubuntu16.json```

2 tasks with stars:
```packer.io build -var-file=variables.json immutable.json```

```./config-scripts/create-reddit-vm.sh```

## HW08
```terraform init```

```terraform plan```

```terraform apply -auto-approve=true```

```terraform show | grep assigned_nat_ip```

```terraform refresh```

```terraform output```

```terraform output app_external_ip```

recreate resource
```terraform taint google_compute_instance.app```

```terraform destroy```

```terraform fmt```

## HW09
```terraform import google_compute_firewall.firewall_ssh default-allow-ssh```

Download modules to .terraform directory
```terraform get```

```tree .terraform```

```terraform graph | dot -Tpng > ~/Загрузки/graph.png```


## HW10

```ansible appserver -i ./inventory -m ping```

```ansible dbserver -m command -a uptime```

Ping group of hosts

```ansible app -m ping```

Ping all hosts

```ansible all -m ping```

```ansible all -m ping -i inventory.yml```

```ansible all -m ping -i inventory.json```

```ansible app -m command -a 'ruby -v'```

```ansible app -m command -a 'bundler -v'```

```ansible app -m shell -a 'ruby -v; bundler -v'```

```ansible db -m command -a 'systemctl status mongod'```

```ansible db -m shell -a 'systemctl status mongod'```

```ansible db -m systemd -a name=mongod```

older but multipurpose

```ansible db -m service -a name=mongod```

```ansible app -m git -a 'repo=https://github.com/Otus-DevOps-2017-11/reddit.git dest=/home/appuser/reddit'```

```ansible app -m command -a 'git clone https://github.com/Otus-DevOps-2017-11/reddit.git /home/appuser/reddit'```

*
create credentials in GCP, download them in json file

set env:

```source gce.sh```

```ansible all -i ./gce.py -m ping```

## HW11

limit - define group of hosts

```ansible-playbook reddit_app.yml --check --limit db```

```ansible-playbook reddit_app.yml --check --tags app-tag --limit app```

```ansible-playbook reddit_app.yml --check --limit app --tags deploy-tag```
