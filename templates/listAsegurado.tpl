{include file="header.tpl"}

<body>
    <section>
        <div class="w-100 mt-4 px-4">
            <h1 class="text-center mb-4">Lista de Asegurados</h1>

            <!-- Campo de búsqueda -->
            <div class="mb-3">
                <input type="text" id="searchInput" class="form-control"
                    placeholder="Buscar asegurado por nombre, apellido o DNI..." />
            </div>

            <!-- Loader -->
            <div id="loader" class="text-center my-4">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Cargando...</span>
                </div>
                <p>Cargando asegurados...</p>
            </div>

            <!-- Tabla -->
            <table class="table table-striped table-bordered" id="aseguradosTable" style="display: none;">
                <thead class="table-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>DNI</th>
                        <th>Fecha Nac.</th>
                        <th>Localidad</th>
                        <th>Marca</th>
                        <th>Año</th>
                        <th>Patente</th>
                        <th>Motor</th>
                        <th>Chasis</th>
                        <th>Abrir</th>
                        {if $logged}
                            <th>Eliminar</th>
                        {/if}
                    </tr>
                </thead>
                <tbody>
                    {foreach $asegurado as $aseguradoItem}
                        <tr>
                            <td>{$aseguradoItem->nombre}</td>
                            <td>{$aseguradoItem->dni}</td>
                            <td>{$aseguradoItem->fecha_nac}</td>
                            <td>{$aseguradoItem->localidad}</td>
                            <td>{$aseguradoItem->marca}</td>
                            <td>{$aseguradoItem->anio}</td>
                            <td>{$aseguradoItem->patente}</td>
                            <td>{$aseguradoItem->motor}</td>
                            <td>{$aseguradoItem->chasis}</td>
                            <td>
                                <a href="router.php?action=aseguradodetail/{$aseguradoItem->id_cliente}"
                                    class="btn btn-primary btn-sm">
                                    ABRIR
                                </a>
                            </td>
                            {if $logged}
                                <td>
                                    <button class="btn btn-danger btn-sm delete-btn" data-id="{$aseguradoItem->id_cliente}"
                                        data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                                        BORRAR
                                    </button>
                                </td>
                            {/if}
                        </tr>
                    {/foreach}
                </tbody>
            </table>

            <!-- Controles de Paginación -->
            <nav aria-label="Table Pagination" class="mt-4">
                <ul class="pagination justify-content-center" id="paginationControls"></ul>
            </nav>

            {if $logged}
                <div class="text-center m-4">
                    <a id="btn-agregar" href="addAsegurado" class="btn btn-success btn-lg">Agregar Asegurado</a>
                </div>
            {/if}
        </div>
    </section>

    <!-- Estilos y JavaScript -->
    <style>
        tbody td {
            text-transform: uppercase;
        }

        #loader {
            display: none;
        }

        .page-item.active .page-link {
            background-color: #007bff;
            color: white;
        }

        /* Fijar la altura del cuerpo de la tabla y establecer un tamaño fijo para las columnas */
        #aseguradosTable {
            table-layout: fixed;
            width: 100%;
        }

        #aseguradosTable th,
        #aseguradosTable td {
            white-space: nowrap;
            /* Evita que el texto se divida en múltiples líneas */
            overflow: hidden;
            /* Oculta el contenido que excede el ancho */
            text-overflow: ellipsis;
            /* Añade puntos suspensivos (...) si el texto es muy largo */
        }

        /* Contenedor con altura fija para el cuerpo de la tabla */
        #aseguradosTable tbody {
            display: block;
            max-height: 300px;
            /* Altura fija para el cuerpo de la tabla */
            overflow-y: auto;
            /* Barra de desplazamiento vertical si es necesario */
        }

        /* Fijar el ancho de las columnas del encabezado para que coincida con el cuerpo */
        #aseguradosTable thead,
        #aseguradosTable tbody tr {
            display: table;
            width: 100%;
            table-layout: fixed;
        }
    </style>

    {literal}
        <script>
            const rowsPerPage = 5; // Filas por página
            const tableBody = document.querySelector("#aseguradosTable tbody");
            const rows = Array.from(tableBody.querySelectorAll("tr"));
            const paginationControls = document.getElementById("paginationControls");
            const searchInput = document.getElementById("searchInput");
            const loader = document.getElementById("loader");
            const table = document.getElementById("aseguradosTable");

            let currentPage = 1;
            const visiblePageCount = 5; // Número de páginas visibles en la paginación
            let filteredRows = rows;

            function displayRows(page) {
                const start = (page - 1) * rowsPerPage;
                const end = start + rowsPerPage;

                rows.forEach(row => (row.style.display = "none"));
                filteredRows.slice(start, end).forEach(row => (row.style.display = ""));
            }

            function setupPagination() {
                const totalPages = Math.ceil(filteredRows.length / rowsPerPage);
                paginationControls.innerHTML = "";

                const startPage = Math.max(1, currentPage - Math.floor(visiblePageCount / 2));
                const endPage = Math.min(totalPages, startPage + visiblePageCount - 1);

                if (currentPage > 1) {
                    const prevItem = document.createElement("li");
                    prevItem.classList.add("page-item");
                    prevItem.innerHTML = `<a href="#" class="page-link">Anterior</a>`;
                    prevItem.addEventListener("click", (e) => {
                        e.preventDefault();
                        currentPage--;
                        displayRows(currentPage);
                        setupPagination();
                    });
                    paginationControls.appendChild(prevItem);
                }

                for (let i = startPage; i <= endPage; i++) {
                    const li = document.createElement("li");
                    li.classList.add("page-item");
                    li.innerHTML = `<a href="#" class="page-link">${i}</a>`;
                    li.addEventListener("click", (e) => {
                        e.preventDefault();
                        currentPage = i;
                        displayRows(currentPage);
                        setupPagination();
                    });
                    paginationControls.appendChild(li);
                }

                if (currentPage < totalPages) {
                    const nextItem = document.createElement("li");
                    nextItem.classList.add("page-item");
                    nextItem.innerHTML = `<a href="#" class="page-link">Siguiente</a>`;
                    nextItem.addEventListener("click", (e) => {
                        e.preventDefault();
                        currentPage++;
                        displayRows(currentPage);
                        setupPagination();
                    });
                    paginationControls.appendChild(nextItem);
                }

                updateActivePage();
                loader.style.display = "none";
                table.style.display = "table";
            }

            function updateActivePage() {
                const pageItems = paginationControls.querySelectorAll(".page-item");
                pageItems.forEach((item, index) => {
                    item.classList.toggle("active", index + 1 === currentPage);
                });
            }

            function filterRows() {
                const searchValue = searchInput.value.toLowerCase()
            .trim(); // Convertir a minúsculas y eliminar espacios innecesarios
                filteredRows = rows.filter(row => {
                    // Verificar si alguno de los campos dentro de la fila contiene el valor de búsqueda
                    const rowText = row.innerText.toLowerCase();
                    return rowText.includes(searchValue); // Búsqueda parcial
                });

                currentPage = 1;
                setupPagination();
                displayRows(currentPage);
            }

            function showLoader() {
                loader.style.display = "block";
            }

            // Inicialización
            showLoader();
            window.addEventListener("DOMContentLoaded", () => {
                setTimeout(() => {
                    setupPagination();
                    displayRows(currentPage);
                }, 1000);
            });

            searchInput.addEventListener("input", filterRows);

            document.addEventListener("DOMContentLoaded", () => {
                let deleteUrl = "";
                const confirmDeleteBtn = document.getElementById("confirmDeleteBtn");

                document.querySelectorAll(".delete-btn").forEach(button => {
                    button.addEventListener("click", () => {
                        const idCliente = button.getAttribute("data-id");
                        deleteUrl = `deleteAsegurado/${idCliente}`;
                    });
                });

                confirmDeleteBtn.addEventListener("click", () => {
                    if (deleteUrl) {
                        window.location.href = deleteUrl;
                    }
                });
            });
        </script>
    {/literal}


    <!-- Modal de Confirmación -->
    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmar Eliminación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    ⚠️ ¿Estás seguro de que deseas eliminar este asegurado? Esta acción no se puede deshacer.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Eliminar</button>
                </div>
            </div>
        </div>
    </div>
</body>