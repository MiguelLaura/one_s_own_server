<!DOCTYPE html>
<html>
  <head>
    <title>Bonjour du site avantages !</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <h1>Aspects positifs et négatifs de l'auto-hébergement en 10 points</h1>
    <table border="1">
      <tr><td><b>Numéro</b></td><td><b>Aspect</b></td><td><b>Positif ?</b></td></tr>
      <?php
  
      /** Connexion **/
      $connexion = new PDO('pgsql:host=postgresql2;port=5432;dbname=apirun', 'laura', '11/07/202311:39');	
      
      /** Préparation et exécution de la requête **/
      $sql = 'SELECT *
              FROM Autohebergement a';
      $resultset = $connexion->prepare($sql);
      $resultset->execute();            
          
      while ($row = $resultset->fetch(PDO::FETCH_ASSOC)) {
          echo '<tr>';
          echo '<td>' . $row['num_aspect'] . '</td>';
          echo '<td>' . $row['aspect'] . '</td>';
          echo '<td>' . $row['pos'] . '</td>';
          echo '</tr>';
          }
          
      /** Déconnexion **/
      $connexion=null;    
      ?>
    </table>
  </body>
</html>
