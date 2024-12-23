<div id="conteiner-formAdd" class="container mt-4">
    <!-- Formulario para agregar asegurado -->
    <h1 class="text-center mb-4">Agregar Asegurado</h1>
    <div class="p-1 shadow-lg border rounded bg-dark-subtle">
        <form id="form-addAsegurado" action="processAddAsegurado" method="POST" class="p-2">

            <style>
                #form-addAsegurado input[type="text"] {
                    text-transform: uppercase;
                }
            </style>

            <!-- DATOS PERSONALES -->
            <div class="alert alert-info text-center mb-4" role="alert">
                <h5 class="mb-0">Ingresar los Datos Personales y Datos del Vehículo</h5>
            </div>

            <div class="row g-2">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-nombre">NOMBRE</label>
                        <input type="text" id="add-nombre" name="nombre" class="form-control form-control-sm"
                            minlength="3" maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-dni">DNI</label>
                        <input type="text" id="add-dni" name="dni" class="form-control form-control-sm" minlength="7"
                            maxlength="200" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-fecha">FECHA DE NACIMIENTO</label>
                        <input type="date" id="add-fecha" name="fecha_nac" class="form-control form-control-sm"
                            required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-calle">CALLE</label>
                        <input type="text" id="add-calle" name="calle" class="form-control form-control-sm"
                            minlength="1" maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-numero">NÚMERO</label>
                        <input type="text" id="add-numero" name="numero" class="form-control form-control-sm"
                            minlength="1" maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-piso">PISO</label>
                        <input type="text" id="add-piso" name="piso" class="form-control form-control-sm" minlength="1"
                            maxlength="25">
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-localidad">LOCALIDAD</label>
                        <input type="text" id="add-localidad" name="localidad" class="form-control form-control-sm"
                            minlength="4" maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-marca">MARCA</label>
                        <input type="text" id="add-marca" name="marca" class="form-control form-control-sm"
                            minlength="4" maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-anio">AÑO</label>
                        <input type="text" id="add-anio" name="anio" class="form-control form-control-sm" minlength="4"
                            maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-patente">PATENTE</label>
                        <input type="text" id="add-patente" name="patente" class="form-control form-control-sm"
                            minlength="4" maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-motor">MOTOR</label>
                        <input type="text" id="add-motor" name="motor" class="form-control form-control-sm"
                            minlength="4" maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-chasis">CHASIS</label>
                        <input type="text" id="add-chasis" name="chasis" class="form-control form-control-sm"
                            minlength="4" maxlength="25" required>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="add-referente">REFERENTE</label>
                        <input type="text" id="add-referente" name="referente" class="form-control form-control-sm"
                        minlength="4" maxlength="50" >
                    </div>
                </div>
            </div>

            <!-- Botón de enviar -->
            <div class="form-group text-center mt-2">
                <input id="button-submit" type="submit" class="btn btn-primary w-25" value="Agregar">
            </div>

        </form>
    </div>
</div>