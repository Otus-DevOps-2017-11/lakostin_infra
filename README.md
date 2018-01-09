# lakostin_infra

1. ssh -At appuser@35.205.147.90 ssh 10.132.0.3
2. touch ~/.ssh/config; chmod 600 ~/.ssh/config
 config file is attached
 'ssh internalhost' works
3. bastion ip: 35.205.147.90 int.ip: 10.132.0.2
   someinternalhost 	     int.ip: 10.132.0.3

HW06
Basic scripts are added

```gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure```

*1 attached create_instance_with_startup.sh

```gcloud compute instances create reddit-app2 --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=startup.sh```

*2 attached create_fw_rule.sh and delete_fw_rule.sh

```gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --target-tags=puma-server --source-ranges=0.0.0.0/0```

```gcloud compute firewall-rules delete default-puma-server```

HW07
Basic files are added
