<?php

require "centro_medico.php";
 $objConexion = new mysqli ("localhost","root","","centromedico");
 
 $sql="select pacNombres,pacApellidos from pacientes";
 $resultados= $objConexion->query($sql);

 while ($paciente=$resultados->fetch_array())
 {

 echo "Apellido".$paciente['pacApellidos'].'<br><br/>';
 echo "Nombre Pacientes:".$paciente['pacNombres'].'<br/>';
 }

 ?>