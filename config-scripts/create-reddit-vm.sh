#!/bin/bash

gcloud compute instances create reddit-app-full\
 --boot-disk-size=10GB \
 --image-family=reddit-full \
# --image-project=ubuntu-os-cloud \
 --image-project=infra-189120 \
 --zone=15\
 --machine-type=g1-small \
 --tags=puma-server \
 --restart-on-failure

gcloud compute instances add-metadata reddit-app-full \
 --metadata='sshKeys=appuser:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLNp3nuZkSyHERZFprClj8zRsbfSfmToT3ScnQrk4E1Io3jpLs61eNiUZsKfXEK3J1e35FYGzfdKtn78kpFrP4zwd1OKu5l7B9cYD1ng+fCAY46pAFQXTcXCmNGt0AaKLy5PtKVYl2RK9BtQY4Wz97c12hs6LzR50xp1YmtVl0wZI3ULEqVRQKFjpTHignWXZisBYC3bQDgiWsnxH6yiFse5hc0OBrO2vadohk5d1NCfYHRAHy+kuL6YkO5YKOfsekFwr64B0paa3eNWVVth23q9Xc7yO4qzlqI0bPaILlTeJ1AxCA4f3v4lmYaxKSpxjblIkq21aFOoW1+HAWv0d7 appuser'