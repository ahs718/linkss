#!/usr/bin/env bash

# Install npm packages in linkss-site directory
echo ""
echo "================================================================="
echo ""
echo "Installing npm packages..."
cd linkss-site || exit
npm install

# Install composer packages in linkss-api directory
echo ""
echo "================================================================="
echo ""
echo "Installing composer packages..."
cd ../linkss-api || exit
composer update

# Copy .env.example to .env
cp .env.example .env
echo ""
echo "================================================================="
echo ""
echo "Copied .env.example to .env..."

# Generate application key
php artisan key:generate
echo ""
echo "================================================================="
echo ""
echo "Generated application key and wrote value to .env file"

# Start mysql server
mysql.server start || exit
echo ""
echo "================================================================="
echo ""
echo "Started mysql server"

# Navigate to project root directory
cd ../

echo ""
echo "================================================================="
echo ""
echo "'cd links-api && php artisan serve' to start the back-end server"
echo "'cd links-site && npm run dev' to start the front-end server"
