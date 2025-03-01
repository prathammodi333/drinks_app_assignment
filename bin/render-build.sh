#!/usr/bin/env bash
set -o errexit

echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs

echo "Installing Rails..."
gem install rails -v 8.0.1

echo "Installing dependencies..."
bundle install

echo "Preparing Rails app..."
chmod +x bin/*
bundle exec rails assets:precompile
bundle exec rails assets:clean

echo "Running database migrations..."
bundle exec rails db:migrate
