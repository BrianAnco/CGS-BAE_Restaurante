<?php
If(!empty($_POST)){
 $serverName = "DESKTOP-7COQCG3"; //serverName\instanceName
// Puesto que no se han especificado UID ni PWD en el array  $connectionInfo,
// La conexión se intentará utilizando la autenticación Windows.
$connectionInfo = array( "Database"=>"BAE_Restaurante");
$conn = sqlsrv_connect( $serverName, $connectionInfo);

$Fecha=$_POST['fecha'];
$Tipo_pedido=$_POST['tipo_pedido'];
$Tipo_pago=$_POST['tipo_pago'];    
$Imagen_pago=$_POST['imagen_pago'];  
$Estado=$_POST['estado'];   
$Comentario=$_POST['comentario'];  
$Id_empleado=$_POST['id_empleado'];  
$Id_cliente=$_POST['id_cliente'];  
$Id_mesa=$_POST['id_mesa'];  
$Direccion_envio=$_POST['direccion_envio'];  

$insertar= "INSERT into Pedido(fecha,tipo_pedido,tipo_pago,imagen_pago,estado,comentario,id_empleado,id_cliente,id_mesa,direccion_envio)
values('$Fecha','$Tipo_pedido','$Tipo_pago',$Imagen_pago,'$Estado','$Comentario',$Id_empleado,$Id_cliente,$Id_mesa,'$Direccion_envio')"; 


//Te faltaba esta lineaX
$recurso=sqlsrv_prepare($conn,$insertar); 

//Para mas seguridad usa el valor retornado por sqlsrv_execute

if(sqlsrv_execute($recurso)){
      header("Location: http://localhost:8080/restaurant/pedido-comida.html");  
} 
    else{
      echo "Ha surgido un error";
}



}
?>