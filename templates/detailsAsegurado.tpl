{include file="header.tpl"}
<body>
<section>
    <div class="container-fluid mt-4">
        <h1 class="text-center mb-4">Detalles del Asegurado</h1>
        <div class="table-responsive">
            <table class="table table-bordered text-center w-100">
                <thead class="table-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>DNI</th>
                        <th>Fecha de Nac.</th>
                        <th>Calle</th>
                        <th>Número</th>
                        <th>Piso</th>
                        <th>Localidad</th>
                        <th>Marca</th>
                        <th>Año</th>
                        <th>Patente</th>
                        <th>Motor</th>
                        <th>Chasis</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <style>
                        tbody td {
                        text-transform: uppercase;
                        }
                    </style>
                        <td>{$asegurado->nombre}</td>
                        <td>{$asegurado->dni}</td>
                        <td>{$asegurado->fecha_nac}</td>
                        <td>{$asegurado->calle}</td>
                        <td>{$asegurado->numero}</td>
                        <td>{$asegurado->piso}</td>
                        <td>{$asegurado->localidad}</td>
                        <td>{$asegurado->marca}</td>
                        <td>{$asegurado->anio}</td>
                        <td>{$asegurado->patente}</td>
                        <td>{$asegurado->motor}</td>
                        <td>{$asegurado->chasis}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

    {if $logged}
        <div class="container mt-2">
            <form id="form-asegurado" action="editAsegurado" method="POST" class="card shadow-lg p-3 rounded-4 bg-light mx-auto" style="max-width: 100%;">
                <h2 class="text-center mb-2">Editar Asegurado</h2>
                <input type="hidden" name="id_cliente" value="{$asegurado->id_cliente}">

                <div class="row g-4">
                    <!-- Fila 1 -->
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="nombre" class="form-label">NOMBRE</label>
                            <input type="text" class="form-control" name="nombre" value="{$asegurado->nombre}" minlength="3" maxlength="30" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="dni" class="form-label">DNI</label>
                            <input type="text" class="form-control" name="dni" value="{$asegurado->dni}" minlength="7" maxlength="20" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="fecha_nac" class="form-label">FECHA DE NACIMIENTO</label>
                            <input type="date" class="form-control" name="fecha_nac" value="{$asegurado->fecha_nac}" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="calle" class="form-label">CALLE</label>
                            <input type="text" class="form-control" name="calle" value="{$asegurado->calle}" required>
                        </div>
                    </div>

                    <!-- Fila 2 -->
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="numero" class="form-label">NÚMERO</label>
                            <input type="text" class="form-control" name="numero" value="{$asegurado->numero}" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="piso" class="form-label">PISO</label>
                            <input type="text" class="form-control" name="piso" value="{$asegurado->piso}">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="localidad" class="form-label">LOCALIDAD</label>
                            <input type="text" class="form-control" name="localidad" value="{$asegurado->localidad}" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="marca" class="form-label">MARCA</label>
                            <input type="text" class="form-control" name="marca" value="{$asegurado->marca}" required>
                        </div>
                    </div>

                    <!-- Fila 3 -->
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="anio" class="form-label">AÑO</label>
                            <input type="number" class="form-control" name="anio" value="{$asegurado->anio}" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="patente" class="form-label">PATENTE</label>
                            <input type="text" class="form-control" name="patente" value="{$asegurado->patente}" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="motor" class="form-label">MOTOR</label>
                            <input type="text" class="form-control" name="motor" value="{$asegurado->motor}" required>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="mb-1">
                            <label for="chasis" class="form-label">CHASIS</label>
                            <input type="text" class="form-control" name="chasis" value="{$asegurado->chasis}" required>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-2">
                    <button class="btn btn-primary btn-lg px-5" type="submit">Guardar</button>
                </div>
            </form>
        </div>
    {/if}
</body>
