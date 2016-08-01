<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
Pagina::header("Consejos");
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
			<label for='buscar'>Escribir título del consejo</label>
		</div>
		<div class='input-field col s6 m4'>
			<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Buscar</button> 	
		</div>
		<div class='input-field col s12 m4'>
			<a href='save_consejos.php' class='btn indigo'><i class='material-icons right'>note_add</i>Nuevo</a>
		</div>
	</form>
	<?php
	if(!empty($_POST))
	{
		$search = trim($_POST['buscar']);
		$sql = "SELECT c.cod_consejo, c.titulo_consejo, c.consejo, u.nom_user, u.apel_user, c.fecha_consejo FROM consejos c, usuarios u WHERE c.cod_user = u.cod_user AND c.titulo_consejo LIKE ? ORDER BY c.titulo_consejo";
		$params = array("%$search%");
	}
	else
	{
		$sql = "SELECT c.cod_consejo, c.titulo_consejo, c.consejo, u.nom_user, u.apel_user, c.fecha_consejo FROM consejos c, usuarios u WHERE c.cod_user = u.cod_user ORDER BY c.titulo_consejo";
		$params = null;
	}
	$data = Database::getRows($sql, $params);
	if($data != null)
	{
		$tabla = 	"<table class='centered striped bordered'>
		<thead>
		<tr>
		<th>TÍTULO</th>
		<th>DESCRIPCIÓN DE CONSEJO</th>
		<th>NOMBRE DEL DOCTOR</th>
		<th>FECHA DE CREACIÓN</th>
		<th>ACCIONES</th>
		</tr>
		</thead>
		<tbody>";
		
		foreach($data as $row)
		{
			$tabla .= 	"<tr>
			<td>$row[titulo_consejo]</td>
			<td>$row[consejo]</td>
			<td>$row[nom_user] $row[apel_user]
			</td>
			<td>$row[fecha_consejo]</td>
			<td>
			<a href='save_consejos.php?id=$row[cod_consejo]' class='btn blue'><i class='material-icons'>mode_edit</i></a>
			<a href='delete_consejos.php?id=$row[cod_consejo]' class='btn red'><i class='material-icons'>delete</i></a>
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