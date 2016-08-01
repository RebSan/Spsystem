<?php 
require("../../sql/pagina.php");
require("../../sql/conexion.php");
Pagina::header("Usuarios");
 ?>

<body>
	<form>
		<!-- etiqueta para poner input-fields -->
		<fieldset method='post'>
			<!-- para poner el tab de agregar y consulatar permisos -->
			<div class="row">
				<div class="col s12 m12">
					<ul class="tabs">
						<li class="tab col s6"><a href="#agregar" class="active">Agregar usuarios</a></li>
						<li class="tab col s6"><a href="#consultar">Consultar usuarios</a></li>
					</ul>
				</div>
			</div>
			<!-- contenedores para gregar -->
			<div id="agregar" class="col s12">
				<div class="row">
					<div class="col s12 m12">
						<div class="input-field col s12 m6">
							<i class="material-icons prefix">security</i>
							<input id="perm" type="text" class="validate">
							<label for="perm">Permiso</label>
						</div>
						<div class="input-field col s12 m6">
							<i class="material-icons prefix">mode_comment</i>
							<input id="desc" type="text" class="validate">
							<label for="desc">Descripcion</label>
						</div>
					</div>
				</div>
				<a class="waves-effect waves-light btn btn-large teal darken-1" href="../index.php"><i class="material-icons">cancel</i>Cancelar</a>
				<button class="waves-effect waves-light btn btn-large teal darken-4" type="submit" name="action"><i class="material-icons">save</i>Guardar</button>
			</div> 
		</fieldset>
		<!-- contenedor para consultar -->
		<div id="consultar" class="col s12">
			<form>
				<fieldset>
					<div class="row">
						<?php 
						Pagina::setInput("number", "txtprueba", "add", "prueba", "12", "6", "pene");
						?>
					</div>
				</fieldset>
			</form>
		</div>
	</form>
	<script src="../../../materialize/js/jquery-2.1.4.min.js"></script>
	<script src="../../../materialize/js/materialize.js"></script>
	<script src="../../../materialize/js/init.js"></script>
</body>
</html>