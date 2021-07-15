# Fromthepage - containerised!

- [Fromthepage - containerised!](#fromthepage---containerised)
  - [Building the fromthepage container](#building-the-fromthepage-container)
  - [Setting up a .env file](#setting-up-a-env-file)
    - [Development or production ?](#development-or-production-)
    - [RECAPTCHA](#recaptcha)
  - [Start it up](#start-it-up)
  - [Changes to defaults](#changes-to-defaults)
  - [First run configuration](#first-run-configuration)

This repo will help you get a containerised version of fromthepage going. Using docker compose it
will start 4 containers: a db container, a minio container (AWS S3), a fromthepage container and an
nginx reverse proxy to fromthepage.

The basic steps to get going are:

-   Build the fromthepage container [see here](#building-the-fromthepage-container)
-   Create a file `.env` in the root with the various config info set
    [see here](#setting-up-a-env-file)
-   start it up [see here](#start-it-up)

## Building the fromthepage container

To find out which versions are available see:
[https://github.com/benwbrum/fromthepage/releases](https://github.com/benwbrum/fromthepage/releases)

Then pass the version you want to build through to the build command following:

```
> docker build --tag fromthepage:latest --build-arg VERSION=21.7 .
```

## Setting up a .env file

The .env file is just the variables used in the docker compose file in a key=value form:

```
MYSQL_ROOT_PASSWORD="admin"

SERVER_HOSTNAME= "localhost"

RAILS_ENV="production"

# ensure these params match whatever you defined for the db up top
DATABASE_URL="mysql2://root:admin@db/ftp_production"

SMTP_ENABLED="true"
SMTP_SERVER="smtp.yourdomain.com"
SMTP_PORT="587"
SMTP_USERNAME="user"
SMTP_PASSWORD="password"
SMTP_DOMAIN="yourdomain.com"
ADMIN_EMAILS="you@yourdomain.com, other-email@yourdomain.com"
SENDING_EMAIL_ADDRESS="fromthepage-support@yourdomain.com"

USE_PNG_LOGO="false"
GUEST_DEED_COUNT=3
GUEST_TRANSCRIPTION_ENABLED="false"
FACEBOOK_PIXEL_ID=""
MIXPANEL_ID=""
GA_ACCOUNT=""
ENABLE_GOOGLEOAUTH=""
GOOGLE_CLIENT_ID=""
GOOGLE_CLIENT_SECRET=""
ENABLE_SAML="false"
RECAPTCHA_SITE_KEY=""
RECAPTCHA_SECRET_KEY=""
INTERCOM_APP_ID=""
INTERCOM_ACCESS_TOKEN=""
MINIO_ACCESS_KEY="minio"
MINIO_SECRET_KEY="minio_pass"
```

You can choose to override all or none of the variables set in the compose file but anything you
define in this file will override anything defined in the compose file. Also, this file is `not`
checked into git.

### Development or production ?

You can start the app up in `development` or `production` mode by setting the `RAILS_ENV` variable
accordingly.

### RECAPTCHA

At the very least you need this or people won't be able to sign up to use the service. Go to
[https://www.google.com/recaptcha/admin/create](https://www.google.com/recaptcha/admin/create) and
follow the instructions there. Be sure to select `reCAPTCHA v2` as the code doesn't work with v3.

Once you have the `RECAPTCHA_SITE_KEY` and `RECAPTCHA_SECRET_KEY` be sure to put them into the .env
file!

## Start it up

To start the environment:

```
> docker compose up
```

If all is well you should see from the page at `http://localhost`.

## Changes to defaults

In order to make this setup work some of the config files in the code are being overwritten. These
are in the `fromthepage` folder in the root of this repo and the hierarchy matches that found in the
code. Also, as we have minio available we are overriding the active storage config so that
fromthepage uses the S3 backend (though I haven't yet checked that this actually works).

## First run configuration

When you first start the environment up you won't be able to get in as there is no admin user. To
set one up do the following:

```
# Find the id of the database container
> docker ps

# exec into the container
> docker exec -it nyingarn-platform_ftp_1 ### be sure to use the correct container name!!

# set up a default administrator
> cd /srv/scripts
> ./create-admin-user.sh

Put in the database password when requested.
```

You can now login with 'administrator' / 'administrator'. Be sure to change the password if this
site is on the net!
