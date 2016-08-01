<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
Pagina::header("Permisos");
?>
<!DOCTYPE html>
<html lang='es'>
<head>
	<meta charset='utf-8'>
	<link type='text/css' rel='stylesheet' href='../../materialize/css/materialize.min.css'/>
	<link type='text/css' rel='stylesheet' href='../../materialize/css/icons.css'/>
	<meta name='viewport' content='width=device-width, initial-scale=1.0'/>
</head>
<body>
	<form method='post' class='row'>   
		<div class='input-field col s12 m12'>
			<a href='guardar.php' class='btn indigo'><i class='material-icons right'>note_add</i>Nuevo</a>
		</div>
	</form>
	<?php
	$consulta = "SELECT * FROM permisos ORDER BY nom_permisos";
	$params = null;
	$data = Database::getRows($consulta, $params);
	if($data != null){
		$tabla = 	"<table class='centered striped'>
		<thead>
			<tr>
				<th>PERMISO</th>
				<th>DESCRIPCIÓN</th>
				<th>ACCIONES</th>
			</tr>
		</thead>
		<tbody>";
			foreach($data as $row)
			{
				$tabla .=	"<tr>
				<td>$row[nom_permisos]</td>
				<td><p class='truncate'>$row[desc_permisos]</p></td>
				<td>
					<a href='guardar.php?id=$row[cod_permisos]' class='btn blue'><i class='material-icons'>mode_edit</i></a>
					<a href='eliminar.php?id=$row[cod_permisos]' class='btn red'><i class='material-icons'>delete</i></a>
				</td>
			</tr>";
		}
		$tabla .= 	"</tbody>
	</table>";
	print($tabla);
}
else
{
	print("<div class='card-panel yellow'><i class='material-icons left'>warning</i>No hay registros.</div>");
}
?>
<script src='../../../../materialize/js/jquery-2.1.4.min.js'></script>
<script src='../../../../materialize/js/materialize.min.js'></script>
</body>
</html>

<?php
Pagina::footer();
?>