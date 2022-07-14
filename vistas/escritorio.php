<?php
//activamos almacenamiento en el buffer
ob_start();
session_start();
if (!isset($_SESSION['nombre'])) {
  header("Location: login.html");
}else{

 
require 'header.php';

if ($_SESSION['escritorio']==1) {

  require_once "../modelos/Consultas.php";
  $consulta = new Consultas();

  $rsptav = $consulta->totalventahoy();
  $regv=$rsptav->fetch_object();
  $totalv=$regv->total_venta;

    //obtener valores para cargar al grafico de barras
  $ventas12 = $consulta->ventasultimos_12meses ();
  $fechasv='';
  $totalesv='';
  while ($regfechav=$ventas12->fetch_object()) {
    $fechasv=$fechasv.'"'.$regfechav->fecha.'",';
    $totalesv=$totalesv.$regfechav->total.',';
  }


  //quitamos la ultima coma
  $fechasv=substr($fechasv, 0, -1);
 $totalesv=substr($totalesv, 0,-1);
 ?>
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="row">
        <div class="col-md-12">
      <div class="box">
<div class="box-header with-border">
  <h1 class="box-title">Panel Principal</h1>
  <div class="box-tools pull-right">
    
  </div>
</div>
<!--box-header-->
<!--centro-->
<div class="panel-body">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
  <div class="small-box bg-yellow" style="text-align: center;">
    <div class="inner">
      <h4 style="font-size: 17px;">
      

        <?php
            require '../config/dbconfig.php';  
            $query = "SELECT idarticulo FROM articulo ORDER BY idarticulo";  
            $query_run = mysqli_query($connection, $query);
            $row = mysqli_num_rows($query_run);
            echo '<strong> '.$row.' </strong>';
        ?>

       
      </h4>
      <p>Productos</p>
    </div>
    <div class="icon">
      <i class="ion ion-bag"></i>
    </div>
    <a href="producto.php" class="small-box-footer">Producto <i class="fa fa-arrow-circle-right"></i></a>
  </div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
  <div class="small-box bg-purple" style="text-align: center;">
    <div class="inner">
      <h4 style="font-size: 17px;">
        <strong>S/. <?php echo $totalv; ?> </strong>
      </h4>
      <p>Ventas</p>
    </div>
    <div class="icon">
      <i class="ion ion-bag"></i>
    </div>
    <a href="venta.php" class="small-box-footer">Ventas <i class="fa fa-arrow-circle-right"></i></a>
  </div>
</div>
</div>
<div class="panel-body">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      Productos de Stock minimo 
    </div>
    <div class="box-body">
      <canvas id="compras" width="400" height="300"></canvas>
    </div>
  </div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
  <div class="box box-primary">
    <div class="box-header with-border">
      Ventas de los ultimo 2 meses
    </div>
    <div class="box-body">
      <canvas id="ventas" width="400" height="300"></canvas>
    </div>
  </div>
</div>
</div>
<!--fin centro-->
      </div>
      </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
<?php 
}else{
 require 'noacceso.php'; 
}

require 'footer.php';
 ?>
  <script src="../public/js/Chart.bundle.min.js"></script>
  <script src="../public/js/Chart.min.js"></script>
  <script src="../public/js/app.js"></script>

 <script>

var ctx = document.getElementById("ventas").getContext('2d');
var ventas = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [<?php echo $fechasv ?>],
        datasets: [{
            label: 'Ventas en S/. de los últimos 2 meses',
            data: [<?php echo $totalesv ?>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                 'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                 'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
 <?php 
}

ob_end_flush();
  ?>

