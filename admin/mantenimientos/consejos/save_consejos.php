<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
require("../../sql/validar.php");

if(empty($_GET['id'])) 
{
    Pagina::header("Agregar Consejo");
    $id = null;
    $titulo = null;
    $consejo = null;
    $nombre = null;
    $fecha = null;
}
else
{
    Pagina::header("Modificar Consejo");
    $id = $_GET['id'];
    $sql = "SELECT c.titulo_consejo, c.consejo, u.nom_user, u.apel_user, c.fecha_consejo FROM consejos c, usuarios u WHERE c.cod_user = u.cod_user AND c.cod_consejo = ? ";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $titulo = $data['titulo_consejo'];
    $consejo = $data['consejo'];
    $nombre = $data['nom_user'];
    $fecha = $data['fecha_consejo'];
}

if(!empty($_POST))
{
    $_POST = Validar::validateForm($_POST);
    $nombre = $_POST['nombre'];
    $categoria = $_POST['categoria'];
    $presentacion = $_POST['presentacion'];
    $descripcion = $_POST['descripcion'];
    $precio = $_POST['precio'];
    $archivo = $_FILES['imagen'];
    $estado = $_POST['estado'];
    if($descripcion == "")
    {
        $descripcion = null;
    }

    try 
    {
     if($archivo['name'] != null)
     {
        $base64 = Validar::validarImagen($archivo);
        if($base64 != false)
        {
            $imagen = $base64;
        }
        else
        {
            throw new Exception("La imagen seleccionada no es valida.");
        }
    }
    else
    {
        throw new Exception("Debe seleccionar una imagen.");
    }

    if($id == null)
    {
        $sql = "INSERT INTO medicamentos(nom_med, cod_cat_med, cod_pre_med, desc_med, pre_med, imagen_med, estado_med) VALUES(?, ?, ?, ?, ?, ?, ?)";
        $params = array($nombre, $categoria, $presentacion, $descripcion, $precio, $imagen, $estado);
    }
    else
    {
        $sql = "UPDATE medicamentos SET nom_med = ?, cod_cat_med = ?, cod_pre_med = ?, desc_med = ?, pre_med = ?, imagen_med = ?, estado_med = ? WHERE cod_med = ?";
        $params = array($nombre, $categoria, $presentacion, $descripcion, $precio, $imagen, $estado,$id);
    }
    Database::executeRow($sql, $params);
    header("location: medicamentos.php");
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
    <title>SpSystem</title>
    <link type='text/css' rel='stylesheet' href='../css/materialize.min.css'/>
    <link type='text/css' rel='stylesheet' href='../css/icons.css'/>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'/>
</head>
<body>
    <form method='post' class='row' enctype='multipart/form-data'>
        <div class='row'>
            <div class='input-field col s12 m6'>
               <i class='material-icons prefix'>add</i>
               <input id='nombre' type='text' name='nombre' class='validate' length='50' maxlenght='50' value='<?php print($nombre); ?>' required/>
                <label for='nombre'>Nombre Medicamento</label>
             </div>
         <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>description</i>
            <input id='descripcion' type='text' name='descripcion' class='validate' length='200' maxlenght='200' value='<?php print($descripcion); ?>'/>
            <label for='descripcion'>Descripción</label>
        </div>
    </div>
    <div class='row'>
        <div class='input-field col s12 m6'>
            <?php
            $sql = "SELECT cod_cat_med, nombre_cat_med FROM categorias_med";
            Pagina::setCombo("categoria", $categoria, $sql);
            ?>
        </div>
        <div class='input-field col s12 m6'>
            <?php
            $sql = "SELECT cod_pre_med, nombre_pre_med FROM pre_med";
            Pagina::setCombo("presentacion", $presentacion, $sql);
            ?>
        </div>
    </div>
    <div class='row'>

        <div class="input-field col s12 m6">
          <i class='material-icons prefix'>shopping_cart</i>
          <input id='precio' type='number' name='precio' class='validate' max='999.99' min='0.01' step='any' value='<?php print($precio); ?>' required/>
          <label for='precio'>Precio ($)</label>
      </div>
      <div class='input-field col s12 m6'>
         <label>Estado:</label>
         <input id='activo' type='radio' name='estado' class='with-gap' value='1' <?php print(($estado == 1)?"checked":""); ?>/>
         <label for='activo'><i class='material-icons'>visibility</i></label>
         <input id='inactivo' type='radio' name='estado' class='with-gap' value='0' <?php print(($estado == 0)?"checked":""); ?>/>
         <label for='inactivo'><i class='material-icons'>visibility_off</i></label>
     </div>

 </div>
 <div class="row">
  <div class='file-field input-field col s12 m6'>
    <div class='btn'>
        <span>Imagen</span>
        <input type='file' name='imagen'>
    </div>
    <div class='file-path-wrapper'>
        <input class='file-path validate' type='text' placeholder='1200x1200px máx., 2MB máx., PNG/JPG/GIF'>
    </div>
</div>
<a href='medicamentos.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
<button type='submit' class='btn blue'><i class='material-icons right'>save</i>Guardar</button>
</div>

</form>
</div>
<script src='../../../materialize/js/jquery-2.2.3.min.js'></script>
<script src='../../../materialize/js/materialize.min.js'></script>
<script>
    $(document).ready(function() { $('.button-collapse').sideNav(); });
    $(document).ready(function() { $('.materialboxed').materialbox(); });
    $(document).ready(function() { $('select').material_select(); });
</script>
</body>
</html>