#!/bin/bash

# create default admin user in the system if there isn't one already
echo "Is there already an administrator user?"
echo '> select count(id) from users where login = "global_admin"' 
mysql -u root -p ftp_production -N -e 'select count(id) from users where login = "administrator"'  | grep -q 1
if [ $? == 1 ] ; then
    echo "No administrator found - create one"
    echo '> insert into users (login, display_name, admin, slug, email, encrypted_password, password_salt, created_at) values ("administrator", "administrator", 1, "administrator", "admin@admin.com", "e0b72fcace0d1f8f7741ef7154da98f31ec953be", "xhuQLxSqXjgUrNCUF2BT", NOW())'
    mysql -u root -p ftp_production -e 'insert into users (login, display_name, admin, slug, email, encrypted_password, password_salt, created_at) values ("administrator", "administrator", 1, "administrator", "admin@admin.com", "e0b72fcace0d1f8f7741ef7154da98f31ec953be", "xhuQLxSqXjgUrNCUF2BT", NOW())'
else
    echo
    echo '>>> Login to 'fromthepage' with user "administrator" and password "administrator"'
    echo
fi