# scripts/post-deploy.sh
#!/bin/sh
php artisan migrate --force
