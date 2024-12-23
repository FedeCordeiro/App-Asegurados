<!-- home.tpl -->
{include file="header.tpl"}

<body>
    <div class="container text-center py-5">
        {if $username}
            <h1 class="display-4 text-primary fadeInAnimation">
                Bienvenido <span class="fw-bold">{$username}</span>!
            </h1>
        {else}
            <h1 class="display-4 text-primary fadeInAnimation">
                Bienvenido!
            </h1>
        {/if}
        
        <div class="mt-4">
            <img src="./css/img/seguros.jpg" alt="Marcelo Arias Seguros" class="rounded-circle shadow-lg mb-4 fadeInImage" width="300" height="250">
        </div>
        
        <h2 class="text-secondary fadeInAnimation">
            <span class="fw-bold">Marcelo Arias</span>
        </h2>
        <h3 class="text-muted fadeInAnimation">
            <span class="fst-italic">Seguros Generales</span>
        </h3>
    </div>

    <form action="exportar" method="POST">
        <button type="submit" class="btn btn-primary mt-2">COPIA DE SEGURIDAD</button>
    </form>
</body>