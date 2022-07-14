<?php 
//incluir la conexion de base de datos
require "../config/Conexion.php";
class Consultas{


//implementamos nuestro constructor
public function __construct(){

}





public function productosdisponibles($fecha_inicio,$fecha_fin){
	$sql = "SELECT nombre, stock FROM producto WHERE stock <= 10 ORDER BY stock ASC LIMIT 10";
}



public function ventasfechacliente($fecha_inicio,$fecha_fin,$idcliente){
	$sql="SELECT DATE(v.fecha_hora) as fecha, u.nombre as usuario, p.nombre as cliente, v.tipo_comprobante,v.serie_comprobante, v.num_comprobante , v.total_venta, v.impuesto, v.estado FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario WHERE DATE(v.fecha_hora)>='$fecha_inicio' AND DATE(v.fecha_hora)<='$fecha_fin' AND v.idcliente='$idcliente'";
	return ejecutarConsulta($sql);
}



public function totalventahoy(){
	$sql="SELECT IFNULL(SUM(total_venta),0) as total_venta FROM venta WHERE DATE(fecha_hora)=curdate()";
	return ejecutarConsulta($sql);
}



public function ventasultimos_12meses(){
	$sql=" SELECT DATE_FORMAT(fecha_hora,'%M') AS fecha, SUM(total_venta) AS total FROM venta GROUP BY MONTH(fecha_hora) ORDER BY fecha_hora DESC LIMIT 0,12";
	return ejecutarConsulta($sql);
}


}

 ?>
