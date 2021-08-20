<?php
If(!empty($_POST)){
 $serverName = "DESKTOP-7COQCG3"; //serverName\instanceName
// Puesto que no se han especificado UID ni PWD en el array  $connectionInfo,
// La conexión se intentará utilizando la autenticación Windows.
$connectionInfo = array( "Database"=>"BAE_Restaurante");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

$Id_pedido=$_POST['id_pedido'];
$Id_producto=$_POST['id_producto'];
$Cantidad=$_POST['cantidad'];     

$insertar= "INSERT into Pedido_Producto(id_pedido,id_producto,cantidad)
values('$Id_pedido','$Id_producto','$Cantidad')"; 


//Te faltaba esta lineaX
$recurso=sqlsrv_prepare($conn,$insertar); 

//Para mas seguridad usa el valor retornado por sqlsrv_execute

if(sqlsrv_execute($recurso)){
      header("Location: http://localhost:8080/restaurant/pedido-producto.html");  
} 
    else{
      echo "Ha surgido un error";
}



}
?>