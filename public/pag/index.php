<?php 
//mando a llamr el archivo php que contiene funciones de fracciones de pagina
require("../cont/pagina.php");
//mando a llamar a la funcion y le mando un parametro
Pagina::header("index");
 ?>
<div class="slider">
	<!--contenedor de la lista -->
	<ul class="slides">
		<!--elemento del slider -->
		<li>
			<img class="obscurecido" src="../img/baner/b1.png"> <!-- se le agrega la clase obscurecido y se le agrega la ruta de la imagen -->
			<div class="caption left-align"><!--para que ponga texto encima de la imagen del slider-->
				<!-- titulo de la imagen del silder -->
				<h3>Personal</h3>
				<h5 class="light grey-text text-lighten-3">Capacitado y siempre tu lado para servirte.</h5>
			</div>
			<!--cierro el contenedor -->
		</li>
		<!--elemento del slider -->
		<li>
			<img class="obscurecido" src="../img/baner/b2.png"> <!-- se le agrega la clase obscurecido y se le agrega la ruta de la imagen -->
			<div class="caption right-align"><!--para que ponga texto encima de la imagen del slider -->
				<h3>Medicamentos</h3>
				<h5 class="light grey-text text-lighten-3">Variedad de medicamentos de las mejores marcas a tu disposición.</h5>
			</div>
		</li>
		<!--cierro el elemento del slider -->
	</ul>
	<!--cierro el contenedor -->
</div>
<!--mando a llamar al model con php-->
<!--Modal para mostrar el perfil del usuario -->
<div id="perf" class="modal">
	<!--Contenedor del modal -->
	<div class="modal-content">
		<div class="row">
		<!-- Contenedor -->
			<div class="container">

				<div class="col s12 m12">
					<h4>Perfil</h4>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col s12">
				<?php 
				require("../../admin/sql/conexion.php");
				$usu = $_SESSION['cod_pac'];
				$sql = "SELECT * FROM pacientes WHERE cod_pac = '$usu' ";
				$data = Database::getRows($sql, null);
				if($data != null)
				{
					$pacie = "";
					foreach ($data as $row) {
						# code...
						$pacie .= "<table>
						<thead>
							<tr>
								<th data-field='img'>Imagen </th>
                            	<th data-field='nom'>Nombre </th>
                            	<th data-field='ape'>Apellido </th>
                            	<th data-field='corr'>Correo </th>
                                <th data-field='pes'>Peso </th>
                                <th data-field='tel'>Telefono </th>
                                <th data-field='dire'>Direccion </th>
                                <th data-field='usu'>Usuario </th>
							</tr>
							<tbody>
								<tr>
									<td>$row[imagen_pac]</td>
									<td>$row[nom_pac]</td>
									<td>$row[apel_pac]</td>
									<td>$row[corre_pac]</td>
									<td>$row[peso_pac]</td>
									<td>$row[tel_pac]</td>
									<td>$row[direc_pac]</td>
									<td>$row[user_pac]</td>
								</tr>
							</tbody>
						<div class='container'>
							<img class='activator' src='data:image/*;base64,$row[imagen_pac]'>
						</div>
						</table>";
					}
					print($pacie);
				}
				else
				{
					print("<div class='card-panel yellow'><i class='material-icons left'>warning</i>No hay productos disponibles en este momento.</div>");
			}
				 ?>
			</div>		
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-action modal-close waves-effect waves-teal btn">Aceptar</a>
	</div>
</div>
<!--cierro el slider -->
<!-- trate de mandar a llamar la funcion para mandar a llamar los script pero no me funciono -->
<!--scrips para llamar los archivos javascrips -->
<script src="../../materialize/js/jquery-2.2.3.min.js"></script>
<script src="../../materialize/js/materialize.js"></script>
<script src="../../materialize/js/init.js"></script>
<?php 
//mando a llamar la funcion que contiene el footer
Pagina::footer();
 ?>
</body>
<!-- Cierro la etiqueta body:v -->
</html>
<!-- cierro la etiqueta html -->