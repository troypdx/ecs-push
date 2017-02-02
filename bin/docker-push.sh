#! /bin/bash
# Tag, Push and Deploy only if it's not a pull request
if [ "$TRAVIS_BRANCH" == "master" ]; then
    tag="pdxdiver/django-web:$COMMIT"
    orig="##TAG##"
    echo "TAG $tag"
    sed "s~$orig~$tag~g" "ecs-deploy.template.yml" > "ecs-deploy.yml"
    docker tag pdxdiver/django-web:latest pdxdiver/django-web:"$COMMIT"
    docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"
    docker push pdxdiver/django-web &&
    ecs-cli compose --project-name ecs-hacko --file ecs-deploy.yml service up;
fi
