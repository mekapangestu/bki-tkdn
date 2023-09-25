#!/bin/bash

# Get servers list
set -f
shell=(ssh -o StrictHostKeyChecking=no "${SSH_USER_STAGING}@${SSH_STAGING}")
git_token=$DEPLOY_TOKEN

echo "Deploy project on server ${name} ${url} ${CI_JOB_STAGE}"
if [ "deploy" = $CI_JOB_STAGE ]; then
    #fase deploy server produksi
    ssh -o StrictHostKeyChecking=no "${SSH_USER_PRD_INT}@${SSH_PRD_INT}" bash <<EOF
    cd /home/administrator
    echo "\n Removing previos clone..."
    if [ ! -d $CI_PROJECT_NAME ]; then
        echo "folder ${CI_PROJECT_NAME} tidak di temukan"
    else
        umount -f -l $CI_PROJECT_NAME/code/storage
        rm -r $CI_PROJECT_NAME
        echo "folder ${CI_PROJECT_NAME} berhasil di hapus"
    fi

    echo "\n Fresh Cloning into remote repo... ${CI_PROJECT_NAME}"
    git clone https://${SANDIDEPLOYER}@repo.bki.co.id/${CI_PROJECT_PATH}.git
    cd ${CI_PROJECT_NAME}

	# Create and activate virtualenv
    echo "\n change env to prod"
    cd code
    chmod 777 -R storage
    # merge env
    sort -u -t '=' -k 1,1 ../.env.prod .env.example > .env
    chown -R 1000:33 ./

    #back to root directory
    cd ..

    #mount NFS
    echo "\n mount NFS"
    mount -t nfs 10.0.1.180:/volume1/Data_TKDN/prod code/storage

    #Removing previus container
    echo "\n Removing previus container"
    sudo docker-compose -f docker-compose-prod.yml down  -v

    echo "\n Create container"
    sudo docker-compose -f docker-compose-prod.yml build
    echo "\n run container to daemon"
    sudo docker-compose -f docker-compose-prod.yml up -d

    echo "\n check php version"
    docker exec tkdn-bki-php php -v

    docker exec tkdn-bki-php chown -R 1000:33 /var/www/html
    docker exec tkdn-bki-php chmod -R 775 /var/www/html/storage
    docker exec tkdn-bki-php chmod -R 775 /var/www/html/storage/framework
    docker exec tkdn-bki-php chmod -R 775 /var/www/html/storage/logs

    # debug
    docker exec tkdn-bki-php id www-data
    docker exec tkdn-bki-php ls -l /var/www/html/storage

    docker exec tkdn-bki-php composer install --ignore-platform-reqs
    docker exec tkdn-bki-php php artisan storage:link
EOF
elif  [ "stagingcontainer" = $CI_JOB_STAGE ]; then
    echo "${CI_JOB_STAGE}"
    ssh -o StrictHostKeyChecking=no "${SSH_USER_STAGING}@${SSH_STAGING}" bash <<EOF
    #fase docker staging
    cd /home/administrator
    echo "\n Removing previos clone..."
    if [ ! -d $CI_PROJECT_NAME ]; then
        echo "folder ${CI_PROJECT_NAME} tidak di temukan"
    else
        umount -f -l $CI_PROJECT_NAME/code/storage
        rm -r $CI_PROJECT_NAME
        echo "folder ${CI_PROJECT_NAME} berhasil di hapus"
    fi

    echo "\n Fresh Cloning into remote repo... ${CI_PROJECT_NAME}"
    git clone https://${SANDIDEPLOYER}@repo.bki.co.id/${CI_PROJECT_PATH}.git
    cd ${CI_PROJECT_NAME}    
	
	# Create and activate virtualenv
    echo "\n change env to staging"
    cd code
    chmod 777 -R storage
    # merge env
    sort -u -t '=' -k 1,1 ../.env.staging .env.example > .env
    chown -R 1000:33 ./
	
    #back to root directory
    cd ..

    #mount NFS
    echo "\n mount NFS"
    mount -t nfs 10.0.1.180:/volume1/Data_TKDN/staging code/storage

    #Removing previus container
    echo "\n Removing previus container"
    sudo docker-compose -f docker-compose-dev.yml down  -v
    
    echo "\n Create container"
    sudo docker-compose -f docker-compose-dev.yml build
    echo "\n run container to daemon"
    sudo docker-compose -f docker-compose-dev.yml up -d
	
    echo "\n check php version"
    docker exec tkdn-bki-php php -v
	
    docker exec tkdn-bki-php chown -R 1000:33 /var/www/html
    docker exec tkdn-bki-php chmod -R 775 /var/www/html/storage
    docker exec tkdn-bki-php chmod -R 775 /var/www/html/storage/framework
    docker exec tkdn-bki-php chmod -R 775 /var/www/html/storage/logs
    
    # debug
    docker exec tkdn-bki-php id www-data
    docker exec tkdn-bki-php ls -l /var/www/html/storage
    
	docker exec tkdn-bki-php composer install --ignore-platform-reqs
    docker exec tkdn-bki-php php artisan key:generate
    docker exec tkdn-bki-php php artisan storage:link
    docker exec tkdn-bki-php php artisan migrate
    docker exec tkdn-bki-php php artisan db:seed

    # cd db
    # echo "\n import last database"
    # cat backup.sql | docker exec -i tkdn-bki-db psql -U root -d tkdn_db

EOF
elif  [ "pullcode" = $CI_JOB_STAGE ]; then
    ssh -o StrictHostKeyChecking=no "${SSH_USER_STAGING}@${SSH_STAGING}" bash <<EOF
    #fase pullcode
    cd /home/administrator
    if [ ! -d $CI_PROJECT_NAME ]; then
        echo "\n Cloning into remote repo... ${CI_PROJECT_NAME}"
        git clone https://${SANDIDEPLOYER}@repo.bki.co.id/${CI_PROJECT_PATH}.git

        # Create and activate virtualenv
        echo "\n change env to staging"
        cd $CI_PROJECT_NAME
        cd code
        chmod 777 -R storage
        #env untuk laravel lumen
        #jika diperlukan tambahkan symlink, chmod, dll
        sort -u -t '=' -k 1,1 ../.env.staging .env.example > .env
        #composer install
    else
        echo "Pulling remote repo origin... ${CI_PROJECT_NAME}"
        cd $CI_PROJECT_NAME
        #git reset --hard
        git pull
        cd code
        sort -u -t '=' -k 1,1 ../.env.staging .env.example > .env
    fi
EOF
elif  [ "codeproduction" = $CI_JOB_STAGE ]; then
    ssh -o StrictHostKeyChecking=no "${SSH_USER_PRD_INT}@${SSH_PRD_INT}" bash <<EOF
     #fase pullcode
     cd /home/administrator
        if [ ! -d $CI_PROJECT_NAME ]; then
            echo "\n Cloning into remote repo... ${CI_PROJECT_NAME}"
            git clone https://${SANDIDEPLOYER}@repo.bki.co.id/${CI_PROJECT_PATH}.git

            # Create and activate virtualenv
            echo "\n change env to staging"
            cd $CI_PROJECT_NAME
            cd code
            chmod 777 -R storage
            #env untuk laravel lumen
            #jika diperlukan tambahkan symlink, chmod, dll
            sort -u -t '=' -k 1,1 ../.env.prod .env.example > .env
            #composer install
        else
            echo "Pulling remote repo origin... ${CI_PROJECT_NAME}"
            cd $CI_PROJECT_NAME
            #git reset --hard
            git pull
            cd code
            sort -u -t '=' -k 1,1 ../.env.prod .env.example > .env
        fi
EOF
fi
