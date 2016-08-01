<?php
require("../sql/pagina.php");
Pagina::header("Bienvenid@");
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
<div class="row">
	<h4>Hoy es <?php print(date('d/m/Y')); ?></h4>
</div>
<div class="container">
	<div class="row">
		<div class="col s12 m6 l12 btn btn-large teal darken-2 separador">
			<a href="../mantenimientos/permisos/" class="white-text">permisos</a>
		</div>
		<div class="col s12 m6 l12 btn btn-large teal darken-2 separador">
		<a href="../mantenimientos/pacientes/usuarios.php" class="white-text">usuarios</a>
		</div>
		<div class="col s12 m6 l12 btn btn-large teal darken-2 separador">
			<a href="../mantenimientos/categories/" class="white-text">categorias</a>
		</div>
		<div class="col s12 m6 l12 btn btn-large teal darken-2 separador">
			<a href="../mantenimientos/medicamentos/medicamentos.php" class="white-text">medicamentos</a>
		</div>
		<div class="col s12 m6 l12 btn btn-large teal darken-2 separador">
		<a href="../mantenimientos/especialidades/" class="white-text">especialidades</a>
		</div>
		<div class="col s12 m6 l12 btn btn-large teal darken-2 separador">
		<a href="../mantenimientos/pacientes/pacientes.php" class="white-text">pacientes</a>
		</div>
		<div class="col s12 m6 l12 btn btn-large teal darken-2 separador">
		<a href="../mantenimientos/pacientes/consejos.php" class="white-text">Consejos</a>
		</div>
	</div>
</div>
<script src='../../../materialize/js/jquery-2.2.3.min.js'></script>
<script src='../../../materialize/js/materialize.min.js'></script>
</body>
</html>
<?php
Pagina::footer();
?>