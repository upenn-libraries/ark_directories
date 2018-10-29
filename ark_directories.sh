#!/bin/bash

manifest=$1
docker exec -it ark_directories_ark_directories_1 mkdir -p /usr/src/app/todos
docker cp ${manifest} ark_directories_ark_directories_1:/usr/src/app/.
docker exec -it ark_directories_ark_directories_1 bundle exec ruby arkdirs_make_todos.rb ${manifest} todos/
docker exec -it ark_directories_ark_directories_1 bash -c "bundle exec ruby arkdirs_generate_directories.rb todos/*.todo"
