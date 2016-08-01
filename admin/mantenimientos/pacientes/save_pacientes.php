<?php
require("../../sql/pagina.php");
require("../../sql/conexion.php");
require("../../sql/validar.php");

if(empty($_GET['id'])) 
{
    Pagina::header("Agregar Paciente");
    $id = null;
    $nombre = null;
    $apellido = null;
    $correo = null;
    $peso = null;
    $fecha = null;
    $telefono = null;
    $direccion = null;
    $user = null;
    $contra = null;
    $imagen = null;
}
else
{
    Pagina::header("Modificar Paciente");
    $id = $_GET['id'];
    $sql = "SELECT nom_pac,apel_pac,corre_pac,peso_pac,fec_nac_pac,tel_pac,direc_pac,user_pac,contra_pac,imagen_pac FROM pacientes WHERE cod_pac = ?";
    $params = array($id);
    $data = Database::getRow($sql, $params);
    $nombre = $data['nom_pac'];
    $apellido = $data['apel_pac'];
    $correo = $data['corre_pac'];
    $peso = $data['peso_pac'];
    $fecha = $data['fec_nac_pac'];
    $telefono = $data['tel_pac'];
    $direccion = $data['direc_pac'];
    $user = $data['user_pac'];
    $contra = $data['contra_pac'];
    $imagen = $data['imagen_pac'];
}

if(!empty($_POST))
{
    $_POST = Validar::validateForm($_POST);
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $correo = $_POST['correo'];
    $peso = $_POST['peso'];
    $fecha = $_POST['fecha'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $user = $_POST['user'];
    $contra = $_POST['contra'];
    $archivo = $_FILES['imagen'];

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

    if($id == null)
    {
        $sql = "INSERT INTO pacientes(nom_pac, apel_pac, corre_pac, peso_pac, fec_nac_pac, tel_pac, direc_pac, user_pac, contra_pac, imagen_pac) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $params = array($nombre,$apellido,$correo,$peso,$fecha,$telefono,$direccion,$user,$contra,$imagen);
    }
    else
    {
        $sql = "UPDATE pacientes SET nom_pac = ?, apel_pac = ?, corre_pac = ?, peso_pac = ?, fec_nac_pac = ?, tel_pac = ?, direc_pac = ?, user_pac = ?, contra_pac = ?, imagen_pac = ?  WHERE cod_pac = ?";
        $params = array($nombre,$apellido,$correo,$peso,$fecha,$telefono,$direccion,$user,$contra,$imagen, $id);
    }
    Database::executeRow($sql, $params);
    header("location: pacientes.php");
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
               <label for='nombre'>Nombre</label>
           </div>
           <div class='input-field col s12 m6'>
               <i class='material-icons prefix'>description</i>
               <input id='descripcion' type='text' name='apellido' class='validate' length='200' maxlenght='200' value='<?php print($apellido); ?>'/>
               <label for='descripcion'>Apellido</label>
           </div>
           <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>description</i>
            <input id='descripcion' type='text' name='correo' class='validate' length='200' maxlenght='200' value='<?php print($correo); ?>'/>
            <label for='descripcion'>Correo</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>description</i>
            <input id='descripcion' type='number' name='peso' class='validate' length='200' maxlenght='200' value='<?php print($peso); ?>'/>
            <label for='descripcion'>Peso</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>description</i>
            <input id='descripcion' type='text' name='fecha' class='validate' length='200' maxlenght='200' value='<?php print($fecha); ?>'/>
            <label for='descripcion'>Fecha</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>description</i>
            <input id='descripcion' type='number' name='telefono' class='validate' length='200' maxlenght='200' value='<?php print($telefono); ?>'/>
            <label for='descripcion'>Telefono</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>description</i>
            <input id='descripcion' type='text' name='direccion' class='validate' length='200' maxlenght='200' value='<?php print($direccion); ?>'/>
            <label for='descripcion'>Direccion</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>description</i>
            <input id='descripcion' type='text' name='user' class='validate' length='200' maxlenght='200' value='<?php print($user); ?>'/>
            <label for='descripcion'>Usuario</label>
        </div>
        <div class='input-field col s12 m6'>
            <i class='material-icons prefix'>description</i>
            <input id='descripcion' type='text' name='contra' class='validate' length='200' maxlenght='200' value='<?php print($contra); ?>'/>
            <label for='descripcion'>Contraseña</label>
        </div>
        <div class='file-field input-field col s12 m6'>
            <div class='btn'>
                <span>Imagen</span>
                <input type='file' name='imagen'>
            </div>
            <div class='file-path-wrapper'>
                <input class='file-path validate' type='text' placeholder='1200x1200px máx., 2MB máx., PNG/JPG/GIF'>
            </div>
        </div>
    </div>
    <a href='pacientes.php' class='btn grey'><i class='material-icons right'>cancel</i>Cancelar</a>
    <button type='submit' class='btn blue'><i class='material-icons right'>save</i>Guardar</button>
</form>
<script src='../../../materialize/js/jquery-2.2.3.min.js'></script>
<script src='../../../materialize/js/materialize.min.js'></script>
<script>
    $(document).ready(function() { $('.button-collapse').sideNav(); });
    $(document).ready(function() { $('.materialboxed').materialbox(); });
    $(document).ready(function() { $('select').material_select(); });
</script>
</body>
</html>
<?php
Pagina::footer();
?>