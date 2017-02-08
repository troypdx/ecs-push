#!/bin/bash
ecs-cli up \
  --keypair dan-ecs-west \
  --capability-iam \
  --size 2 \
  --instance-type t2.large  \
  --port 8000 \
