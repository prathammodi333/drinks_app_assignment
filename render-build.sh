#!/usr/bin/env bash
set -o errexit

echo "Using Render's pre-installed Node.js..."
node -v  # Verify Node.js version
npm -v   # Verify npm version

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
