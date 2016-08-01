<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
require("../../sql/validar.php");
if(empty($_GET['id'])) {
    Pagina::header("Agregar categoría");
    $id = null;
    $nombre = null;
    $descripcion = null;
}
else
{
    Pagina::header("Modificar categoría");
    $id = $_GET['id'];
    $sql = "SELECT * FROM categorias_med WHERE cod_cat_med = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $nombre = $data['nombre_cat_med'];
    $descripcion = $data['desc_cat_med'];
}

if(!empty($_POST))
{
    $_POST = Validar::validateForm($_POST);
  	$nombre = $_POST['nombre'];
  	$descripcion = $_POST['descripcion'];
    if($descripcion == "")
    {
        $descripcion = null;
    }

    try 
    {
      	if($nombre == "")
        {
            throw new Exception("Datos incompletos.");
        }

        if($id == null)
        {
        	$consulta = "INSERT INTO categorias_med(nombre_cat_med, desc_cat_med) VALUES(?, ?)";
            $params = array($nombre, $descripcion);
        }
        else
        {
            $consulta = "UPDATE categorias_med SET nombre_cat_med = ?, desc_cat_med = ? WHERE cod_cat_med = ?";
            $params = array($nombre, $descripcion, $id);
        }
        Database::executeRow($consulta, $params);
        header("location: index.php");
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
<form method='post' class='row' enctype='multipart/form-data'>
    <div class='row'>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>add</i>
          	<input id='nombre' type='text' name='nombre' class='validate' length='50' maxlenght='50' value='<?php print($nombre); ?>' required/>
          	<label for='nombre'>Nombre</label>
        </div>
        <div class='input-field col s12 m6'>
          	<i class='material-icons prefix'>description</i>
          	<input id='descripcion' type='text' name='descripcion' class='validate' length='200' maxlenght='200' value='<?php print($descripcion); ?>'/>
          	<label for='descripcion'>Descripción</label>
        </div>
    </div>
    <a href='index.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
 	<button type='submit' class='btn blue'><i class='material-icons right'>save</i>Guardar</button>
</form>
<script src='../../../materialize/js/jquery-2.1.4.min.js'></script>
<script src='../../../materialize/js/materialize.min.js'></script>
</body>
</html>
<?php
Pagina::footer();
?>