<!DOCTYPE html>
<html>
  <head>
    <title>Bonjour du site commandes !</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <h1>Liste des 10 commandes Linux les plus importantes</h1>
    <table border="1">
	  <tr><td><b>Nom</b></td><td><b>Description</b></td><td><b>Position dans la liste</b></td></tr>
    <?php

    /** Connexion **/
    $connexion = new PDO('pgsql:host=postgresql1;port=5432;dbname=apirun', 'laura', '11/07/202311:39');	
    
    /** Préparation et exécution de la requête **/
    $sql = 'SELECT *
            FROM Commande c
            ORDER BY position';
    $resultset = $connexion->prepare($sql);
    $resultset->execute();            
        
    while ($row = $resultset->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo '<td>' . $row['nom'] . '</td>';
        echo '<td>' . $row['descr'] . '</td>';
        echo '<td>' . $row['position'] . '</td>';
        echo '</tr>';
        }
        
    /** Déconnexion **/
    $connexion=null;    
    ?>
    </table>
  </body>
</html>
