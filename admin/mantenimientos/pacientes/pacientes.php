<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
Pagina::header("Pacientes");
?>

<!DOCTYPE html>
<html lang='es'>
<head>
	<meta charset='utf-8'>
	<title>SpSystem</title>
	<link type='text/css' rel='stylesheet' href='../css/materialize.min.css'/>
	<link type='text/css' rel='stylesheet' href='../css/icons.css'/>
	<meta name='viewport' content='width=device-width, initial-scale=1.0'/>
</head>
<body>

	<form method='post' class='row'>
		<div class='input-field col s6 m4'>
			<i class='material-icons prefix'>search</i>
			<input id='buscar' type='text' name='buscar' class='validate'/>
			<label for='buscar'>Escribir número de expediente</label>
		</div>
		<div class='input-field col s6 m4'>
			<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Buscar</button> 	
		</div>
		<div class='input-field col s12 m4'>
			<a href='save_pacientes.php' class='btn indigo'><i class='material-icons right'>note_add</i>Nuevo</a>
		</div>
	</form>
	<?php
	if(!empty($_POST))
	{
		$search = trim($_POST['buscar']);
		$sql = "SELECT * FROM pacientes WHERE  user_pac LIKE ? ORDER BY user_pac";
		$params = array("%$search%");
	}
	else
	{
		$sql = "SELECT *  FROM pacientes ORDER BY user_pac";
		$params = null;
	}
	$data = Database::getRows($sql, $params);
	if($data != null)
	{
		$tabla = 	"<table class='centered striped bordered'>
		<thead>
			<tr>
				<th>#</th>
				<th>Nombres</th>
				<th>Apellidos</th>
				<th>Coreo</th>
				<th>Peso</th>
				<th>Fecha de nacimiento</th>
				<th>Télefono</th>
				<th>Dirección</th>
				<th>Usuario</th>
				<th>Contraseña</th>
				<th>Imagen</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>";

			foreach($data as $row)
			{
				$tabla .= 	"<tr>
				<td>$row[cod_pac]</td>
				<td>$row[nom_pac]</td>
				<td>$row[apel_pac]</td>
				<td>$row[corre_pac]</td>
				<td>$row[peso_pac] lbs</td>
				<td>$row[fec_nac_pac]</td>
				<td>$row[tel_pac]</td>
				<td>$row[direc_pac]</td>
				<td>$row[user_pac]</td>
				<td>$row[contra_pac]</td>
				<td><img src='data:image/*;base64,$row[imagen_pac]' class='materialboxed' width='100' height='100'></td>
				<td>
				<a href='save_pacientes.php?id=$row[cod_pac]' class='btn blue'><i class='material-icons'>mode_edit</i></a>
					<a href='delete_pacientes.php?id=$row[cod_pac]' class='btn red'><i class='material-icons'>delete</i></a>
				</td>
			</tr>";
		}
		$tabla .= "</tbody>
	</table>";
	print($tabla);
}
else
{
	print("<div class='card-panel yellow'><i class='material-icons left'>warning</i>No hay registros.</div>");
}
?>

<script src='../../../materialize/js/jquery-2.2.3.min.js'></script>
<script src='../../../materialize/js/materialize.min.js'></script>
<script>
	$(document).ready(function() { $('.button-collapse').sideNav(); });
	$(document).ready(function() { $('.materialboxed').materialbox(); });
	$(document).ready(function() { $('select').material_select(); });
</script>
</body>
</html>