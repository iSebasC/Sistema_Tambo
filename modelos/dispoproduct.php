<?php 
//incluir la conexion de base de datos
require "../config/Conexion.php";
class Articulo{

//metodo para mostrar registros
public function mostrar($idarticulo){
	$sql="SELECT * FROM articulo WHERE idarticulo='$idarticulo'";
	return ejecutarConsultaSimpleFila($sql);
}

//listar Disponibilidad Productos
public function listarDispo(){
	$sql = "SELECT a.idcategoria,c.nombre as categoria, a.nombre,a.stock,a.descripcion FROM articulo a INNER JOIN Categoria c ON a.idcategoria=c.idcategoria";
	return ejecutarConsulta($sql);
}

}
?>