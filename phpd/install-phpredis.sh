#!/bin/bash
#############################################
# install phpredis 
#############################################

## step 1. install depends auto conf
sudo apt-get install autoconf      ## for ubuntu
## yum install autoconf            ## for rhel and centos

## step 2. download source code
wget https://github.com/nicolasff/phpredis/tarball/master

## step 3. configure, compile and install 
cd src
~/php5/bin/phpize
./configure --with-php-config=/home/vagrant/php5/bin/php-config
make
make install

## step 4. setting php.ini, add follow two lines in php5/etc/php.ini
# extension=redis.so
# extension_dir = "/home/aborn/php5/lib/php/extensions/no-debug-non-zts-20121212"
## after that you should check out the phpredis extension module, using 
#  php -m |grep redis


## step 5. if possible
## if occurs  
##    Fatal error: Class 'redis' not found 
## during using class redis,

## please use follow in php code
# if (!extension_loaded('redis')) {                                     
#	##echo "no load!";
#    if (!dl('redis.so')) {
#		exit;
#	}   
#}  

## step 6. install phpRedisAdmin, 
##    first you show change your directory
git clone https://github.com/ErikDubbelboer/phpRedisAdmin.git
cd phpRedisAdmin                                                                                                                                               
git clone https://github.com/nrk/predis.git vendor
