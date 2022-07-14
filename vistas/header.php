<?php 
if (strlen(session_id())<1) 
  session_start();

  ?>
 <!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Tambo | Panel Principal</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="../public/css/bootstrap.min.css">
  <!-- Font Awesome -->

  <link rel="stylesheet" href="../public/css/font-awesome.min.css">

  <link rel="stylesheet" href="../public/css/AdminLTE.min.css">
  <link rel="stylesheet" href="../public/css/_all-skins.min.css">
  <!-- Morris chart --><!-- Daterange picker -->
 <link rel="stylesheet" href="img/apple-touch-ico.png">
 <link rel="stylesheet" href="img/favicon.ico">
<!-- DATATABLES-->
<link rel="stylesheet" href="../public/datatables/jquery.dataTables.min.css">
<link rel="stylesheet" href="../public/datatables/buttons.dataTables.min.css">
<link rel="stylesheet" href="../public/datatables/responsive.dataTables.min.css">
<link rel="stylesheet" href="../public/css/bootstrap-select.min.css">

<link rel="icon" type="image/png" href="../assets/images/logo-icon.png">


<style>
  .box-body {
				width: 100%;
				height: auto;
			}
</style>

</head>
<body class="hold-transition skin-white sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="escritorio.php" class="logo">
         <!-- mini logo for sidebar mini 50x50 pixels -->
         <img src="../assets/images/logo-menuT.png">
        <!-- logo for regular state and mobile devices -->
       </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">NAVEGACIÓM</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">

          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../files/usuarios/<?php echo $_SESSION['imagen']; ?>" class="user-image" alt="User Image">
              <span class="hidden-xs" style="color: black;"><?php echo $_SESSION['nombre']; ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="../files/usuarios/<?php echo $_SESSION['imagen']; ?>" class="img-circle" alt="User Image">
                
                <p style="color: black;">Desarrollo de software
                  <small style="color: black;">2021</small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default">Perfil</a>
                </div>
                <div class="pull-right">
                  <a href="../ajax/usuario.php?op=salir" class="btn btn-default">Salir</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->

        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
     
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">

<br>
<br>
       <?php 
if ($_SESSION['escritorio']==1) {
  echo ' <li><a href="escritorio.php"><i class="fa  fa-dashboard (alias)"></i> <span style="color: black;">Panel principal</span></a>
        </li>';
}
        ?>

      <?php
if ($_SESSION['productos']==1) {
  echo ' <li class="treeview">
          <a href="#">
            <i class="fa fa-archive"></i> <span style="color: black;">Productos</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
            <li><a href="producto.php"><i class="fa fa-check"></i>Registro de productos</a>
            <li><a href="categoria.php"><i class="fa fa-check"></i>Categorias</a></li></a>
          </ul>  
        </li>';
}
        ?>
<?php 
if ($_SESSION['clientes']==1) {
  echo ' <li class="treeview">
          <a href="#">
            <i class="fa fa-child"></i> <span style="color: black;">Clientes</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="cliente.php"><i class="fa fa-check"></i> Registro Clientes</a></li>
          </ul>
         </li>';
}
        ?>
               <?php 
if ($_SESSION['inventario']==1) {
  echo ' <li class="treeview">
          <a href="#">
            <i class="fa fa-industry"></i> <span style="color: black;">Inventario</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="inventario.php"><i class="fa fa-check"></i>Registro</a></li>
            <li><a href="proveedor.php"><i class="fa fa-check"></i>Registro Proveedor</a></li>
          </ul>
        </li>';
}
?>
        
               <?php 
if ($_SESSION['ventas']==1) {
  echo '<li class="treeview">
          <a href="#">
            <i class="fa fa-shopping-cart"></i> <span style="color: black;">Ventas</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="venta.php"><i class="fa fa-check"></i> Realizar ventas</a></li>
          </ul>
        </li>';
}
        ?>
                                     <?php 
if ($_SESSION['consultac']==1) {
  echo '     <li class="treeview">
          <a href="#">
            <i class="fa fa-bar-chart"></i> <span style="color: black;">Reporte Inventario</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="reporteproducto.php"><i class="fa fa-check"></i>Disponibilidad de Productos</a></li>
          </ul>
        </li>';
}
        ?>  
              
                                                <?php 
if ($_SESSION['consultav']==1) {
  echo '<li class="treeview">
          <a href="#">
            <i class="fa fa-bar-chart"></i> <span style="color: black;">Reporte Ventas</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="ventasfechacliente.php"><i class="fa fa-check"></i> Consulta Ventas</a></li>

          </ul>
        </li>';
}
        ?>

                             <?php 
if ($_SESSION['acceso']==1) {
  echo '  <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> <span style="color: black;">Acceso</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="usuario.php"><i class="fa fa-check"></i> Usuarios</a></li>
            <li><a href="permiso.php"><i class="fa fa-check"></i> Permisos</a></li>
          </ul>
        </li>';
}
        ?>    
            
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>