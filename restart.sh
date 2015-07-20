#!/usr/bin/env bash

export RAILS_ENV="production"
export SECRET_KEY_BASE="5d433d24694ad83d7583ae8ebcd66a1bce5086ad6876822c34eba3c516307dbf3b1cd423bffb2fc5c877aecd270c0813866d05dd729afa9cacff60c632cc55a5"

echo "Assets precompile"
rake assets:precompile

echo "Restart server"
pumactl -F config/puma.rb stop
pumactl -F config/puma.rb start
