<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
Pagina::header("Presentacion medica");
?>
<form method='post' class='row'>
	<div class='input-field col s6 m4'>
      	<i class='material-icons prefix'>search</i>
      	<input id='buscar' type='text' name='buscar' class='validate'/>
      	<label for='buscar'>Búsqueda</label>
    </div>
    <div class='input-field col s6 m4'>
    	<button type='submit' class='btn grey left'><i class='material-icons right'>pageview</i>Aceptar</button> 	
  	</div>
  	<div class='input-field col s12 m4'>
		<a href='save.php' class='btn indigo'><i class='material-icons right'>note_add</i>Nuevo</a>
  	</div>
</form>
<?php
if(!empty($_POST))
{
	$search = trim($_POST['buscar']);
	$sql = "SELECT * FROM pre_med WHERE nombre_pre_med LIKE ? ORDER BY nombre_pre_med";
	$params = array("%$search%");
}
else
{
	$sql = "SELECT * FROM pre_med ORDER BY nombre_pre_med";
	$params = null;
}
$data = Database::getRows($sql, $params);
if($data != null)
{
	$tabla = 	"<table class='centered striped'>
					<thead>
			    		<tr>
				    		<th>NOMBRE</th>
				    		<th>DESCRIPCIÓN</th>
				    		<th>ACCIÓN</th>
			    		</tr>
		    		</thead>
		    		<tbody>";
		foreach($data as $row)
		{
	        $tabla .=	"<tr>
	            			<td>$row[nombre_pre_med]</td>
	            			<td><p class='truncate'>$row[desc_pre_med]</p></td>
	            			<td>
	            				<a href='save.php?id=$row[cod_pre_med]' class='btn blue'><i class='material-icons'>mode_edit</i></a>
								<a href='delete.php?id=$row[cod_pre_med]' class='btn red'><i class='material-icons'>delete</i></a>
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
Page::footer();
?>