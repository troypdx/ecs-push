#! /bin/bash
# Push only if it's not a pull request
if [ "$TRAVIS_BRANCH" == "master" ]; then
    docker tag pdxdiver/django-web:latest pdxdiver/django-web:"$COMMIT"
    docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"
    docker push pdxdiver/django-web &&
    ecs-cli compose --project-name ecs-hacko --file ecs-deploy.yml service rm;
    ecs-cli compose --project-name ecs-hacko --file ecs-deploy.yml service up;
fi
