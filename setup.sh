#!/usr/bin/env bash

# Install npm packages in linkss-site directory
echo "Installing npm packages..."
cd linkss-site || exit
npm install

# Install composer packages in linkss-api directory
echo "Installing composer packages..."
cd ../linkss-api || exit
composer update

# Copy .env.example to .env
cp .env.example .env
echo "Copied .env.example to .env..."

# Generate application key
php artisan key:generate
echo "Generated application key and wrote value to .env file"

# Navigate to project root directory
cd ../

echo "'cd links-api && php artisan serve' to start the back-end server"
echo "'cd links-site && npm run dev' to start the front-end server"
