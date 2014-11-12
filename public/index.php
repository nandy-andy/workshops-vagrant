<html>
   <head>
      <title>Wikia Workshops</title>
   </head>
   <body>
      <pre>
      <?php
         define( STATUS_OK, 'OK' );
         define( STATUS_FAILED, 'Failed' );

         echo 'Welcome to Wikia workshop virtual machine!' . "\n";
         
         echo "\n";
         echo "Apache status:\t\t\t" . STATUS_OK . "\n";
         echo "PHP status:\t\t\t" . STATUS_OK . "\n";

         try {
            $pdo = new PDO('mysql:dbname=wikia_workshops;host=localhost', 'root', 'rootpass');
            $pdo->exec("SET CHARACTER SET utf8");
            echo "DB status:\t\t\t" . STATUS_OK . "\n";
         } catch(PDOException $e) {
            echo "DB status:\t\t\t" . STATUS_FAILED . "\n";
            echo 'Database connection failed: ' . $e->getMessage() . "\n";
         } catch(Exception $e) {
            echo "DB status:\t\t\t" . STATUS_FAILED . "\n";
            echo 'Something went wrong: ' . $e->getMessage() . "\n";
         }

         $memc = new Memcache();
         $memc->pconnect('localhost', 11211);
         $memcStatus = $memc->getStats() !== false ? STATUS_OK : STATUS_FAILED;
         echo "Memcached status:\t\t$memcStatus\n";

         $memc = new Memcache();
         $memcPhpStatus = is_object($memc) ? STATUS_OK : STATUS_FAILED;
         echo "Memcached PHP client status:\t$memcPhpStatus\n";

         $xdebugEnabled = xdebug_is_enabled();
         $xdebugStatus = $xdebugEnabled ? STATUS_OK : STATUS_FAILED;
         echo "XDebug status:\t\t\t$xdebugStatus\n";

         $webgrindStatus = file_exists( '/var/www/webgrind/index.php' ) ? STATUS_OK : STATUS_FAILED;
         echo "Webgrind status:\t\t$webgrindStatus\n";
      ?>
      </pre>
   </body>
</html>

