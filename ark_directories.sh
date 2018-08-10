#!/bin/bash

mkdir todos

manifest=$1
ruby arkdirs_make_todos.rb ${manifest} todos/
ruby arkdirs_generate_directories.rb todos/*.todo

rm -rf todos