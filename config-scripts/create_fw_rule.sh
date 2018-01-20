#!/bin/bash
gcloud compute firewall-rules create default-puma-server \
--allow tcp:9292 \
--target-tags=puma-server \
--source-ranges=0.0.0.0/0

