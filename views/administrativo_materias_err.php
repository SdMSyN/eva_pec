<?php require('header.php'); ?>

	<title><?= $tit; ?></title>
	<meta name="author" content="Luigi Pérez Calzada (GianBros)" />
	<meta name="description" content="Descripción de la página" />
	<meta name="keywords" content="etiqueta1, etiqueta2, etiqueta3" />

</head>
<body class="hold-transition skin-blue sidebar-mini">

  <?php require('navbar.php'); ?>

	<?php
		if(isset($_SESSION['sessU']) AND $_SESSION['userPerfil'] == 2){ 
	?>
	
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
			<div class="row">
				<div class="col-xs-3">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Buscar matería" id="buscar" >
						<span class="input-group-btn">
						<button class="btn btn-default" type="button" onclick="load(1);"><i class="fa fa-search"></i></button>
						</span>
					</div>
				</div>
				<div class="col-xs-4"></div>
				<div class="col-xs-5 ">
					<div class="btn-group pull-right">
						<a href="#" class="btn btn-default" data-toggle="modal" data-target="#modalAddProf"><i class="fa fa-plus"></i> Nueva</a>
						<!-- <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Mostrar <span class="caret"></span>
						</button> -->
					</div>
				</div>
			</div>

			<!-- modal añadir nueva matería -->
				<form class="form-horizontal" id="formAddMat" name="formAddMat">
					<div class="modal fade" id="modalAddProf" tabindex="-1" role="dialog" aria-labellebdy="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">Nueva Matería</h4>
									<p class="divError"></p>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label for="inputName" class="col-sm-3 control-label">Nombre (Completo)</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="inputName" name="inputName" required>
										</div>
									</div>
									<div class="form-group">
										<label for="inputGrado" class="col-sm-3 control-label">Grado</label>
										<div class="col-sm-9">
											<select class="form-control" id="inputGrado" name="inputGrado" required></select>
										</div>
									</div>
								</div><!-- ./modal-body -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									<button type="submit" id="guardar_datos" class="btn btn-primary">Añadir</button>
								</div><!-- ./modal-footer -->
							</div><!-- ./modal-content -->
						</div><!-- ./modal-dialog -->
					</div><!-- ./modal fade -->
				</form>
			<!-- fin modal -->
			
			<!-- modal editar profesor -->
				<form class="form-horizontal" id="formUpdProf" name="formUpdProf">
					<div class="modal fade" id="modalUpdProf" tabindex="-1" role="dialog" aria-labellebdy="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">Editar Profesor</h4>
									<p class="divError"></p>
								</div>
								<div class="modal-body">
									<div class="nav-tabs-custom">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#navProf" data-toggle="tab">Profesor</a></li>
											<li><a href="#navContact" data-toggle="tab">Contacto</a></li>
											<li><a href="#navDir" data-toggle="tab">Dirección</a></li>
										</ul>
										<div class="tab-content">
											<div class="active tab-pane" id="navProf">
												<input type="hidden" id="inputIdUser" name="inputIdUser" >
												<input type="hidden" id="inputIdInfo" name="inputIdInfo" >
												<div class="form-group">
													<label for="inputName" class="col-sm-3 control-label">Nombre (Completo)</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="inputName" name="inputName" required>
													</div>
												</div>
												<div class="form-group">
													<label for="inputUser" class="col-sm-3 control-label">Usuario</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="inputUser" name="inputUser" required>
													</div>
												</div>
												<div class="form-group">
													<label for="inputPass" class="col-sm-3 control-label">Contraseña</label>
													<div class="col-sm-9">
														<input type="password" class="form-control" id="inputPass" name="inputPass" required>
													</div>
												</div>
											</div><!-- ./tab-pane -->
											<div class="tab-pane" id="navContact">
												<div class="form-group">
													<label class="col-sm-3 control-label" id="inputTel">Teléfono:</label>
													<div class="input-group col-sm-9">
														<div class="input-group-addon">
															<i class="fa fa-phone"></i>
														</div>
														<input type="text" class="form-control" id="inputTel" name="inputTel" >
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" id="inputMail">Correo electrónico:</label>
													<div class="input-group col-sm-9">
														<div class="input-group-addon">
															<i class="fa fa-envelope"></i>
														</div>
														<input type="text" class="form-control" id="inputMail" name="inputMail" >
													</div>
												</div>
											</div><!-- ./tab-pane -->
											<div class="tab-pane" id="navDir">
												<div class="form-group">
													<label for="inputDir" class="col-sm-3 control-label">Dirección</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" id="inputDir" name="inputDir" >
													</div>
												</div>
											</div><!-- ./tab-pane -->
										</div><!-- ./tab-content -->
									</div><!-- ./nav-tabs-custom  -->
								</div><!-- ./modal-body -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									<button type="submit" id="guardar_datos" class="btn btn-primary">Registrar</button>
								</div><!-- ./modal-footer -->
							</div><!-- ./modal-content -->
						</div><!-- ./modal-dialog -->
					</div><!-- ./modal fade -->
				</form>
			<!-- fin modal -->
    </section>

    <!-- Main content -->
    <section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Listado de materias</h3>
							<div class="divError"></div>
						</div>
						<div class="box-body">
							<div class="table table-condensed table-hover table-striped">
								<table class="table table-striped table-bordered" id="data">
									<thead>
										<tr>
											<th><span title="nameMat">Nombre</span></th>
											<th><span title="nameGrade">Grado</span></th>
											<th>Acciones</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div><!-- ./table -->
						</div><!-- ./box-body -->
					</div><!-- ./box -->
				</div><!-- ./col-sm-12 -->
			</div><!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
	<?php require('footer.php'); ?>
	<!-- scripts acá -->
	
	<script>
		$(".loader").hide();
		var ordenar = '';
		$(document).ready(function(){
			
			//Obtenemos los grados del nivel escolar del usuario
			$.ajax({
				type: "POST",
				url: "../controllers/get_grados.php",
				data: {nivEsc: <?= $_SESSION['nivEscId']; ?>},
				success: function(msg){
					console.log(msg);
					var msg = jQuery.parseJSON(msg);
					if(msg.error == 0){
						$("#formAddMat .modal-body #inputGrado").html("");
						$.each(msg.dataRes, function(i, item){
							$("#formAddMat .modal-body #inputGrado").append($('<option>', { 
								value: msg.dataRes[i].id,
								text : msg.dataRes[i].nombre
							}));
						});
					}else{
						$("#formAddMat .modal-body #inputGrado").append($('<option>', { 
							value: 0,
							text : "No existen grados en tu nivel Escolar"
						}));
					}
				}
			})
			
			filtrar();
			function filtrar(){
				$(".loader").show();
				$.ajax({
					type: "POST",
					data: ordenar,
					url: "../controllers/get_materias.php",
					success: function(msg){
						console.log(msg);
						var msg = jQuery.parseJSON(msg);
						if(msg.error == 0){
							$("#data tbody").html("");
							$.each(msg.dataRes, function(i, item){
								var newRow = '<tr>'
									+'<td>'+msg.dataRes[i].nombre+'</td>'
									+'<td>'+msg.dataRes[i].grado+'</td>'
									+'<td><div class="btn-group pull-right dropdown">'
										+'<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" >Acciones <span class="fa fa-caret-down"></span></button>'
									+'<ul class="dropdown-menu">'
										+'<li><a href="#" data-toggle="modal" data-target="#modalUpdProf" id="editar" data-value="'+msg.dataRes[i].id+'"><i class="fa fa-edit"></i> Editar</a></li>';
										newRow +=  (msg.dataRes[i].edoId == "1") ? '<li><a href="#" id="borrar" data-value="'+msg.dataRes[i].id+'" data-edo="1" ><i class="fa fa-trash"></i> Dar de baja</a></li>' : '<li><a href="#" id="borrar" data-value="'+msg.dataRes[i].id+'" data-edo="2" ><i class="fa fa-user-plus"></i> Dar de alta</a></li>'
									+'</ul></div></td>'
									+'</tr>';
								$(newRow).appendTo("#data tbody");
							})
						}else{
							var newRow = '<tr><td colspan="3">'+msg.msgErr+'</td></tr>';
							$("#data tbody").html(newRow);
						}
					},
					error: function(x, e){
						var cadErr = '';
						if (x.status==0) {
							cadErr = '¡Estas desconectado!\n Por favor checa tu conexión a Internet.';
						} else if(x.status==404) {
							cadErr = 'Página no encontrada.';
						} else if(x.status==500) {
							cadErr = 'Error interno del servidor.';
						} else if(e=='parsererror') {
							cadErr = 'Error.\nFalló la respuesta JSON.';
						} else if(e=='timeout'){
							cadErr = 'Tiempo de respuesta excedido.';
						} else {
							cadErr = 'Error desconocido.\n'+x.responseText;
						}
						alert(cadErr);
					}
				});
				$(".loader").hide();
			}
			
			//Ordenar ASC y DESC header tabla
			$("#data th span").click(function(){
				if($(this).hasClass("desc")){
					$("#data th span").removeClass("desc").removeClass("asc");
					$(this).addClass("asc");
					ordenar = "&orderby="+$(this).attr("title")+" asc";
				}else{
					$("#data th span").removeClass("desc").removeClass("asc");
					$(this).addClass("desc");
					ordenar = "&orderby="+$(this).attr("title")+" desc";
				}
				filtrar();
			});
			
			$("#buscar").keyup(function(){
				var consulta = $(this).val();
				$.ajax({
					type: "POST",
					data: {ordenar: ordenar, query: consulta},
					url: "../controllers/get_profesores.php",
					success: function(msg){
						console.log(msg);
						var msg = jQuery.parseJSON(msg);
						if(msg.error == 0){
							$("#data tbody").html("");
							$.each(msg.dataRes, function(i, item){
								var newRow = '<tr>'
									+'<td>'+msg.dataRes[i].nombre+'</td>'
									+'<td>'+msg.dataRes[i].user+'</td>'
									+'<td><div class="btn-group pull-right dropdown">'
										+'<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" >Acciones <span class="fa fa-caret-down"></span></button>'
									+'<ul class="dropdown-menu">'
										+'<li><a href="#" data-toggle="modal" data-target="#cliente" ><i class="fa fa-edit"></i> Editar</a></li>'
										+'<li><a href="#" data-toggle="modal" data-target="#cliente" ><i class="fa fa-trash"></i> Borrar</a></li>'
									+'</ul></div></td>'
									+'</tr>';
								$(newRow).appendTo("#data tbody");
							})
						}else{
							var newRow = '<tr><td colspan="3">'+msg.msgErr+'</td></tr>';
							$("#data tbody").html(newRow);
						}
					},
					error: function(x, e){
						var cadErr = '';
						if (x.status==0) {
							cadErr = '¡Estas desconectado!\n Por favor checa tu conexión a Internet.';
						} else if(x.status==404) {
							cadErr = 'Página no encontrada.';
						} else if(x.status==500) {
							cadErr = 'Error interno del servidor.';
						} else if(e=='parsererror') {
							cadErr = 'Error.\nFalló la respuesta JSON.';
						} else if(e=='timeout'){
							cadErr = 'Tiempo de respuesta excedido.';
						} else {
							cadErr = 'Error desconocido.\n'+x.responseText;
						}
						alert(cadErr);
					}
				});
			})
		
			$("#data").on("click", "#editar", function(){
				var idProf2 = $(this).data('value');
				console.log(idProf2);
				$(".loader").show();
				$.ajax({
					type: "POST",
					url: "../controllers/get_profesor.php",
					data: {idProf: idProf2},
					success: function(msg){
						console.log(msg);
						var datos = jQuery.parseJSON(msg);
						$("#modalUpdProf .modal-body #navProf #inputIdUser").val(datos.dataRes[0].id);
						$("#modalUpdProf .modal-body #navProf #inputIdInfo").val(datos.dataRes[0].idInfo);
						$("#modalUpdProf .modal-body #navProf #inputName").val(datos.dataRes[0].nombre);
						$("#modalUpdProf .modal-body #navProf #inputUser").val(datos.dataRes[0].user);
						$("#modalUpdProf .modal-body #navProf #inputPass").val(datos.dataRes[0].pass);
						$("#modalUpdProf .modal-body #navContact #inputTel").val(datos.dataRes[0].tel);
						$("#modalUpdProf .modal-body #navContact #inputMail").val(datos.dataRes[0].mail);
						$("#modalUpdProf .modal-body #navDir #inputDir").val(datos.dataRes[0].dir);
						$(".loader").hide();
					},
					error: function(x, e){
						var cadErr = '';
						if (x.status==0) {
							cadErr = '¡Estas desconectado!\n Por favor checa tu conexión a Internet.';
						} else if(x.status==404) {
							cadErr = 'Página no encontrada.';
						} else if(x.status==500) {
							cadErr = 'Error interno del servidor.';
						} else if(e=='parsererror') {
							cadErr = 'Error.\nFalló la respuesta JSON.';
						} else if(e=='timeout'){
							cadErr = 'Tiempo de respuesta excedido.';
						} else {
							cadErr = 'Error desconocido.\n'+x.responseText;
						}
						alert(cadErr);
					}
				})
			})
			
			$(document).on("click",".modal-body li a",function(){
        tab = $(this).attr("href");
        $(".modal-body .tab-content div").each(function(){
					$(this).removeClass("active");
        });
        $(".modal-body .tab-content "+tab).addClass("active");
			});
		
			$("#data").on("click", "#borrar", function(){
				var idProf = $(this).data('value');
				var idEdo = parseInt($(this).data('edo'));
				var msgBorrar = '';
				if(idEdo == 1) msgBorrar = "¿Seguro que deseas dar de baja a este profesor?";
				else msgBorrar = "¿Seguro que deseas dar de alta a este profesor?";
				if(confirm(msgBorrar)){
					$(".loader").show();
					$.ajax({
						type: "POST",
						url: "../controllers/delete_profesor.php",
						data: {idProf: idProf, idEdo: idEdo},
						success: function(response){
							var datos = jQuery.parseJSON(response);
							if(datos.error == 0){
								$(".loader").hide();
								$(".divError").removeClass("bg-danger");
								$(".divError").addClass("bg-success");
								$(".divError").html(datos.dataRes);
								setTimeout(function(){
									location.reload();
								}, 2000);
							}else{
								$(".loader").hide();
								$(".divError").removeClass("bg-success");
								$(".divError").addClass("bg-danger");
								$(".divError").html(datos.dataRes);
								setTimeout(function(){
									$(".divError").hide();
								}, 3000);
							}
						}
					})
				}else{
					alert("Ten cuidado.");
				}
			});
		
		});	
	</script>
	
	<script>
		var form1 = $( "#formAddProf" );
		form1.validate({ 
			ignore: "",
			rules:{
				inputName: {required: true},
				inputUser: {required: true, maxlength: 20},
				inputPass: {required: true, maxlength: 20},
				inputTel: {digits: true, maxlength: 10, minlength: 10},
				inputMail: {email: true}
			},
			messages:{
				inputName: "Nombre obligatorio",
				inputUser: {
					required: "Usuario obligatorio",
					maxlength: "Máximo 20 caracteres"
				},
				inputPass: {
					required: "Contraseña obligatoria",
					maxlength: "Máximo 20 caracteres"
				},
				inputTel: {
					digits: "Solo se permiten números",
					maxlength: "Máximo 10 números",
					minlength: "Mínimo 10 números"
				},
				inputMail: "Formato de correo invalido"
			},
			errorPlacement: function ( error, element ) {
				error.addClass( "help-block" );
				element.parents( ".col-sm-9" ).addClass( "has-feedback" );
				if ( element.prop( "type" ) === "checkbox" ) {
					error.insertAfter( element.parent( "label" ) );
				} else {
					error.insertAfter( element );
				}
				if ( !element.next( "span" )[ 0 ] ) {
					$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
				}
			},
			highlight: function ( element, errorClass, validClass ) {
				$( element ).parents( ".col-sm-9" ).addClass( "has-error" ).removeClass( "has-success" );
				$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
			},
			unhighlight: function ( element, errorClass, validClass ) {
				$( element ).parents( ".col-sm-9" ).addClass( "has-success" ).removeClass( "has-error" );
				$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
			}
		});
		$( "#formAddProf" ).submit(function( event ) {
			var form1 = $(this).valid(); 
			var parametros = $(this).serialize();
			if (this.hasChildNodes('.nav.nav-tabs')) {
				var validator = $(this).validate();
				$(this).find("input").each(function () {
					if (!validator.element(this)) {
						form1= false;
						$('a[href=\\#' + $(this).closest('.tab-pane:not(.active)').attr('id') + ']').tab('show');
						return false;
					}
				});
			}
			if (form1) {
				$(".loader").show();
				$('#guardar_datos').attr("disabled", true);	
				$.ajax({
					type: "POST",
					url: "../controllers/create_profesor.php",
					data: parametros,
					success: function(msg){
						var datos = jQuery.parseJSON(msg);
						if(datos.error == 0){
							$(".divError").removeClass("bg-danger");
							$(".divError").addClass("bg-success");
							$(".divError").html(datos.msg);
							setTimeout(function(){
								location.reload();
							}, 3000);
						}else{
							$(".divError").removeClass("bg-success");
							$(".divError").addClass("bg-danger");
							$(".divError").html(datos.msg);
							$(".loader").hide();
							setTimeout(function(){
								$(".divError").hide();
							}, 3000);
						}
					},
					error: function(x, e){
						var cadErr = '';
						if (x.status==0) {
							cadErr = '¡Estas desconectado!\n Por favor checa tu conexión a Internet.';
						} else if(x.status==404) {
							cadErr = 'Página no encontrada.';
						} else if(x.status==500) {
							cadErr = 'Error interno del servidor.';
						} else if(e=='parsererror') {
							cadErr = 'Error.\nFalló la respuesta JSON.';
						} else if(e=='timeout'){
							cadErr = 'Tiempo de respuesta excedido.';
						} else {
							cadErr = 'Error desconocido.\n'+x.responseText;
						}
						$(".divError").addClass("bg-danger");
						$(".divError").html(cadErr);
						setTimeout(function(){
							$(".divError").hide();
						}, 3000);
					}
				});
				event.preventDefault();
			} 
		})
	</script>
	
	<script>
		var form2 = $( "#formUpdProf" );
		form2.validate({ 
			ignore: "",
			rules:{
				inputName: {required: true},
				inputUser: {required: true, maxlength: 20},
				inputPass: {required: true, maxlength: 20},
				inputTel: {digits: true, maxlength: 10, minlength: 10},
				inputMail: {email: true}
			},
			messages:{
				inputName: "Nombre obligatorio",
				inputUser: {
					required: "Usuario obligatorio",
					maxlength: "Máximo 20 caracteres"
				},
				inputPass: {
					required: "Contraseña obligatoria",
					maxlength: "Máximo 20 caracteres"
				},
				inputTel: {
					digits: "Solo se permiten números",
					maxlength: "Máximo 10 números",
					minlength: "Mínimo 10 números"
				},
				inputMail: "Formato de correo invalido"
			},
			errorPlacement: function ( error, element ) {
				error.addClass( "help-block" );
				element.parents( ".col-sm-9" ).addClass( "has-feedback" );
				if ( element.prop( "type" ) === "checkbox" ) {
					error.insertAfter( element.parent( "label" ) );
				} else {
					error.insertAfter( element );
				}
				if ( !element.next( "span" )[ 0 ] ) {
					$( "<span class='glyphicon glyphicon-remove form-control-feedback'></span>" ).insertAfter( element );
				}
			},
			highlight: function ( element, errorClass, validClass ) {
				$( element ).parents( ".col-sm-9" ).addClass( "has-error" ).removeClass( "has-success" );
				$( element ).next( "span" ).addClass( "glyphicon-remove" ).removeClass( "glyphicon-ok" );
			},
			unhighlight: function ( element, errorClass, validClass ) {
				$( element ).parents( ".col-sm-9" ).addClass( "has-success" ).removeClass( "has-error" );
				$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
			}
		});
		$( "#formUpdProf" ).submit(function( event ) {
			var form2 = $(this).valid(); 
			var parametros = $(this).serialize();
			if (this.hasChildNodes('.nav.nav-tabs')) {
				var validator = $(this).validate();
				$(this).find("input").each(function () {
					if (!validator.element(this)) {
						form2= false;
						$('a[href=\\#' + $(this).closest('.tab-pane:not(.active)').attr('id') + ']').tab('show');
						return false;
					}
				});
			}
			if (form2) {
				$(".loader").show();
				$('#guardar_datos').attr("disabled", true);	
				$.ajax({
					type: "POST",
					url: "../controllers/update_profesor.php",
					data: parametros,
					success: function(msg){
						console.log(msg);
						var datos = jQuery.parseJSON(msg);
						if(datos.error == 0){
							$(".loader").hide();
							$(".divError").removeClass("bg-danger");
							$(".divError").addClass("bg-success");
							$(".divError").html(datos.msg);
							setTimeout(function(){
								location.reload();
							}, 3000);
						}else{
							$(".loader").hide();
							$(".divError").removeClass("bg-success");
							$(".divError").addClass("bg-danger");
							$(".divError").html(datos.msg);
							setTimeout(function(){
								$(".divError").hide();
							}, 3000);
						}
					},
					error: function(x, e){
						$(".loader").hide();
						var cadErr = '';
						if (x.status==0) {
							cadErr = '¡Estas desconectado!\n Por favor checa tu conexión a Internet.';
						} else if(x.status==404) {
							cadErr = 'Página no encontrada.';
						} else if(x.status==500) {
							cadErr = 'Error interno del servidor.';
						} else if(e=='parsererror') {
							cadErr = 'Error.\nFalló la respuesta JSON.';
						} else if(e=='timeout'){
							cadErr = 'Tiempo de respuesta excedido.';
						} else {
							cadErr = 'Error desconocido.\n'+x.responseText;
						}
						$(".divError").addClass("bg-danger");
						$(".divError").html(cadErr);
						setTimeout(function(){
							$(".divError").hide();
						}, 3000);
					}
				});
				event.preventDefault();
			} 
		})
	</script>
	
		<?php 
			}else{
		?>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Error 401
				</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="error-page">
					<h2 class="headline text-yellow"> 401</h2>

					<div class="error-content">
						<h3><i class="fa fa-warning text-yellow"></i> Oops! No tienes autorización para visualizar ésta página.</h3>

						<p>
							<a href="login.php">Inicia sesión</a> para poder visualizar el contenido, lamentamos las molestias.
						</p>

					</div>
					<!-- /.error-content -->
				</div>
				<!-- /.error-page -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<?php require('footer.php'); ?>
		<script>
			$(".loader").hide();
		</script>
		<?php
			}
		?>
</body>
</html>
