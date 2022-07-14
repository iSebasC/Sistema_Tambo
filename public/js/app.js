$(document).ready(function(){
	$.ajax({
		url: "http://localhost/SistemaTambo/config/data.php",
		method: "GET",
		success: function(data) {
			console.log(data);
			var nombre = [];
			var stock = [];

			for(var i in data) {
				nombre.push("" + data[i].nombre);
				stock.push(data[i].stock);
			} 

			var chartdata = {
				labels: nombre,
				datasets : [
					{
						label: 'Productos',
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
                        borderWidth: 2,    
						data: stock
						
					}
				]
			};

			var ctx = $("#compras");

            var barGraph = new Chart(ctx, {
                type: 'bar',
                data: chartdata,
                options: {
                    responsive: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });

			
		},
		error: function(data) {
			console.log(data);
		}
	});
});