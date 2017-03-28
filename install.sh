installdir="/Volumes/D/www/jeoga"
dbhost="localhost"
dbname="jeoga_website_db"
dbuser="root"
dbpass=
url="http://localhost/jeoga_website"
title="Jeoga"
admin_user="jeoga"
admin_pass="1234"
admin_email="admin@jeoga.com"
git_origin="git@github.com:jeoga/jeoga_website.git"

mkdir -p $installdir
cd $installdir;


function press_enter
{
    echo ""
    echo -n "Press Enter to continue"
    read
    clear
}

function download
{
    rm -rf *;
    rm -rf .gitignore;
    rm -rf .git

	wp core download;

    mkdir wp-content/uploads
    chmod 775 wp-content/uploads

    curl -O http://jeoga.com/.gitignore;

    git init;
    git remote add origin $git_origin
    git add -A;
    git commit -m "Wordpress Installed";

}

function config
{
	wp core config --dbhost=$dbhost --dbname=$dbname --dbuser=$dbuser --dbpass=
}

function install
{
    wp core install --url="$url" --title="$title" --admin_user="$admin_user" --admin_password="$admin_pass" --admin_email="$admin_email"
}

function createUsers
{
    wp user create manager manager@jeoga.com --role=administrator --user_pass=1234
    wp user create developer developer@jeoga.com --role=administrator --user_pass=1234
}

function installUsualPlugins
{
    wp plugin install redux-framework --activate
    wp plugin install timber-library --activate
    wp plugin install meta-box --activate
    wp plugin install wordpress-seo --activate
    wp plugin install contact-form-7 --activate
    wp plugin install bwp-minify
    wp plugin install wordfence
    wp plugin install https://github.com/rilwis/meta-box/archive/4.10.4.zip --activate
    git add -A;
    git commit -m "Usual Plugins Installed";
}


function installTheme
{
    wp theme install http://s3.amazonaws.com/bucketname/my-theme.zip?AWSAccessKeyId=123&amp;Expires=456&amp;Signature=abcdef
    git add -A;
    git commit -m "Theme Boilerplate Installed";
}



selection=
until [ "$selection" = "0" ]; do
    echo ""
    echo "PROGRAM MENU"
    echo "1 - Download Wordpress"
    echo "2 - Create Database Setting"
    echo "3 - Install Wordpress"
    echo "4 - Create Users"
    echo "5 - Install Usual Plugins"
    echo "6 - Install Theme Boilerplate"
    echo ""
    echo "0 - exit program"
    echo ""
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) download ; press_enter ;;
        2 ) config ; press_enter ;;
		3 ) install ; press_enter ;;
        4 ) createUsers ; press_enter ;;
        5 ) installUsualPlugins ; press_enter ;;
        6 ) installTheme ; press_enter ;;
        7 ) createCookies ; press_enter ;;
        0 ) exit ;;
        * ) echo "Please enter 1, 2, or 0"; press_enter
    esac
done
       