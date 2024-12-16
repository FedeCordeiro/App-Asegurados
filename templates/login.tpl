{include file="header.tpl"}

<body>
    <div class="container mt-5">
        {if !$logged}
            <!-- Formularios de Registro e Inicio de Sesión -->
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <form id="form-register" action="verifyRegister" method="POST" class="card shadow p-4">
                        <h2 class="text-center mb-4">Registrarse</h2>
                        <div class="form-group mb-3">
                            <label for="usernameRegister">Usuario</label>
                            <input type="text" class="form-control" name="usernameRegister" id="usernameRegister" 
                                   placeholder="Ingrese su usuario" minlength="8" maxlength="15" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="passwordRegister">Contraseña</label>
                            <input type="password" class="form-control" name="passwordRegister" id="passwordRegister" 
                                   placeholder="Ingrese su contraseña" minlength="5" maxlength="15" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Registrarse</button>
                    </form>
                </div>
                <div class="col-md-5">
                    <form id="form-login" action="verifyLogin" method="POST" class="card shadow p-4">
                        <h2 class="text-center mb-4">Iniciar Sesión</h2>
                        <div class="form-group mb-3">
                            <label for="usernameLogin">Usuario</label>
                            <input type="text" class="form-control" name="usernameLogin" id="usernameLogin" 
                                   placeholder="Ingrese su usuario" minlength="8" maxlength="15" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="passwordLogin">Contraseña</label>
                            <input type="password" class="form-control" name="passwordLogin" id="passwordLogin" 
                                   placeholder="Ingrese su contraseña" minlength="5" maxlength="15" required>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Ingresar</button>
                    </form>
                </div>
            </div>

            <!-- Mensaje de Error -->
            {if $error}
                <div class="alert alert-danger mt-4 text-center">
                    <h3>{$error}</h3>
                </div>
            {/if}
        {/if}

        {if $logged}
            <!-- Mensaje para usuarios logueados -->
            <div class="alert alert-info mt-5 text-center">
                <h3>Le notificamos que ya ha iniciado sesión previamente. No es posible realizar un inicio de sesión adicional en este momento.</h3>
            </div>
        {/if}
    </div>
</body>
