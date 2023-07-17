<!DOCTYPE html>
<html>
  <head>
    <title>Informations sur le serveur</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="../style.css">
  </head>
  <body>
    <h1>Infos serveur</h1>
    <ul>
      <li>Le nom de votre utilisateur : 
        <code>
        <?php
              ini_set('display_errors', 1);
              ini_set('display_startup_errors', 1);
              error_reporting(E_ALL);
          ?>
          <?php
              exec('whoami', $user);
              echo $user[0];
          ?>
        </code>
      </li>
      <li>La distribution utilisée : 
        <code>
          <?php
            exec('grep "RETTY_NAME=" /etc/os-release | cut -d\= -f2', $release);
            if (preg_match('/^"(.*)"/', $release[0], $pieces)) {
              echo $pieces[1];
            }
            // exec("lsb_release -a", $release);
          ?>
        </code>
      </li>
      <li>La version de noyau Linux utilisée : 
        <code>
          <?php
            exec("uname -r", $kernel);
            echo $kernel[0];
          ?>
        </code>
      </li>
      <li>La taille de la mémoire RAM :
        <ul>
          <li>Total :
            <code>
              <?php
                exec("cat /proc/meminfo", $ram_tot);
                $pieces = array();
                if (preg_match('/^MemTotal:\s+([\.,\w]+)/', $ram_tot[0], $pieces)) {
                  echo $pieces[1]."kB";
                }
              ?>
            </code>
          </li>
          <li>Dispo :
            <code>
              <?php
                exec("cat /proc/meminfo", $ram_tot);
                $pieces = array();
                if (preg_match('/^MemFree:\s+([\.,\w]+)/', $ram_tot[1], $pieces)) {
                  echo $pieces[1]."kB";
                }
              ?>
            </code>
          </li>
        </ul>
      </li>
      <li>La taille du disque dur :
        <ul>
          <li>Total :
            <code>
              <?php
                // echo disk_total_space(".");
                exec("df -h", $disk_tot);
                $pieces = array();
                if (preg_match_all('/([\.,\-\/\w]+)/', $disk_tot[2], $pieces)) {
                  echo $pieces[1][1];
                }
              ?>
            </code>
          </li>
          <li>Dispo :
            <code>
              <?php
                // echo disk_free_space(".");
                exec("df -h", $disk_dispo);
                $pieces = array();
                if (preg_match_all('/([\.,\-\/\w]+)/', $disk_dispo[2], $pieces)) {
                  echo $pieces[1][3];
                }
              ?>
            </code>
          </li>
        </ul>
      </li>
    </ul>
  </body>
</html>
