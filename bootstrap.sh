echo ""
echo "============================================"
echo "Welcome to Wikia workshops' virtual machine!"
echo "============================================"
echo ""

# installing MySQL server..."
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password rootpass"
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password rootpass"
sudo apt-get update
sudo apt-get -y install mysql-server-5.5 php5-mysql 

# installing Apache2 server, PHP5 and Git...
sudo apt-get -y install apache2 php5 libapache2-mod-php5 git

# creating database and tables
if [ ! -f /var/log/databasesetup ];
then
  echo "Creating database and needed tables..."
  echo "CREATE USER 'workshops'@'localhost' IDENTIFIED BY 'workshops'" | mysql -uroot -prootpass
  echo "CREATE DATABASE wikia_workshops" | mysql -uroot -prootpass
  echo "GRANT ALL ON workshops.* TO 'wikia_workshops'@'localhost'" | mysql -uroot -prootpass
  echo "flush privileges" | mysql -uroot -prootpass

  touch /var/log/databasesetup

  if [ -f /vagrant/data/sql/initial.sql ];
  then
    mysql -uroot -prootpass wikia_workshops < /vagrant/data/sql/initial.sql
  fi
fi

# installing apache
if [ ! -h /var/www ]; 
then 
  
  # copying httpd.conf with ServerName directive
  if [ -f /vagrant/data/apache2/httpd.conf ];
  then
    if [ -f /etc/apache2/httpd.conf ];
    then
      rm /etc/apache2/httpd.conf
    fi

    cp /vagrant/data/apache2/httpd.conf /etc/apache2/httpd.conf
  fi

  rm -rf /var/www sudo
  ln -s /vagrant/public /var/www

  a2enmod rewrite

  sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default

  cp /vagrant/data/apache2/www.blog.lc /etc/apache2/sites-available/www.blog.lc
  a2ensite www.blog.lc

  service apache2 restart
fi

# installing XDebug
if [ ! -f /usr/lib/php5/xdebug/xdebug.so ];
then
  if [ ! -d /usr/lib/php5/xdebug ];
  then
    mkdir /usr/lib/php5/xdebug
  fi

  cp /vagrant/data/usr/lib/php5/xdebug/xdebug.so /usr/lib/php5/xdebug/xdebug.so

  echo "zend_extension=/usr/lib/php5/xdebug/xdebug.so" >> /etc/php5/apache2/php.ini
  echo "xdebug.profiler_enable = 0" >> /etc/php5/apache2/php.ini
  echo "xdebug.profiler_output_dir = /tmp/" >> /etc/php5/apache2/php.ini
  echo "xdebug.profiler_enable_trigger = 1" >> /etc/php5/apache2/php.ini
  echo "xdebug.auto_trace = 0" >> /etc/php5/apache2/php.ini
  echo "xdebug.show_mem_delta = 0" >> /etc/php5/apache2/php.ini
  echo "xdebug.trace_options = 1" >> /etc/php5/apache2/php.ini
  echo "xdebug.collect_params = 3" >> /etc/php5/apache2/php.ini
  echo "xdebug.collect_return = 1" >> /etc/php5/apache2/php.ini
  echo "xdebug.remote_connect_back = 1" >> /etc/php5/apache2/php.ini
  echo "xdebug.remote_enable = 1" >> /etc/php5/apache2/php.ini
fi

# installing Webgrind
if [ ! -f /var/www/webgrind/index.php ];
then
  if [ ! -d /var/www/webgrind ];
  then
    mkdir /var/www/webgrind
  fi
  
  cp -r /vagrant/data/var/www/webgrind/* /vagrant/public/webgrind/
fi

service apache2 restart
