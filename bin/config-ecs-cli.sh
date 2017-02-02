#!/bin/bash
ecs-cli configure \
  --region us-west-2 \
  --access-key $AWS_ACCESS_KEY \
  --secret-key $AWS_SECRET_KEY  \
  --cluster ecs-hacko \
  --compose-project-name-prefix " " \
  --compose-service-name-prefix " " \
  --cfn-stack-name-prefix " "

ecs-cli up \
  --keypair dan-ecs-west \
  --capability-iam \
  --size 1 \
  --instance-type t2.large  \
  --port 8000 \
