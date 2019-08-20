<h1>Registrarse</h1>

<form action="index.php?controller=usuario&action=save" method="POST">

    <label for="nombre">Nombre</label>
    <input type="text" name="Nombre" required/>

    <label for="apellido">Apellido</label>
    <input type="text" name="apellido" required/>

    <label for="email">Email</label>
    <input type="text" name="email" required/>

    <label for="password">Contrasena</label>
    <input type="text" name="password" required/>

    <label for="telefono">Telefono</label>
    <input type="text" name="telefono" required/>

    <label for="direccion">Direccion</label>
    <input type="text" name="direccion" required/>

    <input tupe="submit" value="Registrarse"/>

</form>