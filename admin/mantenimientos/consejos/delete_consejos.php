<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
Pagina::header("Eliminar consejo");

if(!empty($_GET['id'])) 
{
    $id = $_GET['id'];
}
else
{
    header("location: consejos.php");
}

if(!empty($_POST))
{
	$id = $_POST['id'];
	try 
	{
		$sql = "DELETE FROM consejos WHERE cod_consejo = ?";
	    $params = array($id);
	    Database::executeRow($sql, $params);
	    header("location: consejos.php");
	} 
	catch (Exception $error) 
	{
		print("<div class='card-panel red'><i class='material-icons left'>error</i>".$error->getMessage()."</div>");
	}
}
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
	<input type='hidden' name='id' value='<?php print($id); ?>'/>
	<button type='submit' class='btn red'><i class='material-icons right'>done</i>Si</button>
	<a href='index.php' class='btn grey'><i class='material-icons right'>cancel</i>No</a>
</form>
<script src='../../../materialize/js/jquery-2.2.3.min.js'></script>
<script src='../../../materialize/js/materialize.min.js'></script>
</body>
</html>
<?php
Pagina::footer();
?>