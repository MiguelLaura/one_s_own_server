<!DOCTYPE html>
<html>
  <head>
    <title>Bonjour du site conseils !</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <h1>10 conseils à ceux qui souhaitent s'auto-héberger</h1>
    <table border="1">
      <tr><td><b>Numéro du conseil</b></td><td><b>Description</b></td></tr>
      <?php
  
      /** Connexion **/
      $connexion = new PDO('pgsql:host=postgresql3;port=5432;dbname=apirun', 'laura', '11/07/202311:39');	
      
      /** Préparation et exécution de la requête **/
      $sql = 'SELECT *
              FROM Conseil c';
      $resultset = $connexion->prepare($sql);
      $resultset->execute();            
          
      while ($row = $resultset->fetch(PDO::FETCH_ASSOC)) {
          echo '<tr>';
          echo '<td>' . $row['num_conseil'] . '</td>';
          echo '<td>' . $row['descr'] . '</td>';
          echo '</tr>';
          }
          
      /** Déconnexion **/
      $connexion=null;    
      ?>
    </table>
  </body>
</html>
