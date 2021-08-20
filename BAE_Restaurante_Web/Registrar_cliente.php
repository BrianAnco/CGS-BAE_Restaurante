<?php
If(!empty($_POST)){
 $serverName = "DESKTOP-7COQCG3"; //serverName\instanceName
// Puesto que no se han especificado UID ni PWD en el array  $connectionInfo,
// La conexión se intentará utilizando la autenticación Windows.
$connectionInfo = array( "Database"=>"BAE_Restaurante");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

$Num_documento=$_POST['num_documento'];
$Tipo_documento=$_POST['tipo_documento'];
$Nombres=$_POST['nombres'];    
$Apellidos=$_POST['apellidos'];  
$Direccion=$_POST['direccion'];   
$Celular=$_POST['celular'];  

$insertar= "INSERT into Cliente(num_documento,tipo_documento,nombres,apellidos,direccion,celular)
values('$Num_documento','$Tipo_documento','$Nombres','$Apellidos','$Direccion','$Celular')"; 


//Te faltaba esta lineaX
$recurso=sqlsrv_prepare($conn,$insertar); 

//Para mas seguridad usa el valor retornado por sqlsrv_execute

if(sqlsrv_execute($recurso)){
      header("Location: http://localhost:8080/restaurant/index.html");  
} 
    else{
      echo "Ha surgido un error";
}



}
?>