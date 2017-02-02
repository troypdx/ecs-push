#! /bin/bash
# Push only if it's not a pull request
if [ "$TRAVIS_BRANCH" == "master" ]; then
    docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"
    docker tag $REPO:$COMMIT $REPO:$TAG
    docker tag $REPO:$COMMIT $REPO:travis-$TRAVIS_BUILD_NUMBER
    docker push pdxdiver/django-web &&
    ecs-cli compose --project-name ecs-hacko --file ecs-deploy.yml service up;
fi
