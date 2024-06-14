<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla con CSS</title>
    <link rel="stylesheet" href="css/tablita.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

</head>

<body>

    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Correo</th>
                <th>Fecha de ingreso</th>
                <th>Acciones</th> 
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Pepe</td>
                <td>Pollo</td>
                <td>pollitosalsa@hdhweysn.com</td>
                <td>14/6/2024</td>
                <td class="acciones">
                    <i class='bx bxs-trash'></i>
                    <i class='bx bxs-edit-alt'></i>
                </td> 
            </tr>

            <tr>
                <td>Ricardo</td>
                <td>Pollo</td>
                <td>pollitosalsa@hdhweysn.com</td>
                <td>14/6/2024</td>
                <td class="acciones">
                    <i class='bx bxs-trash'></i>
                    <i class='bx bxs-edit-alt'></i>
                </td> 
            </tr>


            <tr>
                <td>moor</td>
                <td>sandwich</td>
                <td>tomate@hdhweysn.com</td>
                <td>14/6/2024</td>
                <td class="acciones">
                    <i class='bx bxs-trash'></i>
                    <i class='bx bxs-edit-alt'></i>
                </td> 
            </tr>
        </tbody>
    </table>

</body>

</html>