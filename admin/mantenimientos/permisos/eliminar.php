<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
Pagina::header("Eliminar Permisos");
if(!empty($_GET['id'])) 
{
    $id = $_GET['id'];
}
else
{
    header("location: index.php");
}

if(!empty($_POST))
{
	$id = $_POST['id'];
	try 
	{
		$consulta = "DELETE FROM permisos WHERE cod_permisos = ?";
	    $params = array($id);
	    Database::executeRow($consulta, $params);
	    header("location: index.php");
	} 
	catch (Exception $error) 
	{
		print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
	}
}
?>
<form method='post' class='row'>
	<input type='hidden' name='id' value='<?php print($id); ?>'/>
	<button type='submit' class='btn red'><i class='material-icons right'>done</i>Si</button>
	<a href='index.php' class='btn grey'><i class='material-icons right'>cancel</i>No</a>
</form>
<?php
Pagina::footer();
?>