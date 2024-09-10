CREATE TABLE Publicaciones (
id INT PRIMARY KEY,
id_Usuarios INT FOREIGN KEY,
id_Productos INT FOREIGN KEY,
Titulo VARCHAR(50),
Imagen VARCHAR(200),
Descripcion TEXT
);

CREATE TABLE Usuarios (
id INT PRIMARY KEY,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Correo VARCHAR(200),
Numero_de_Telefono INT,
Direccion VARCHAR(200)
);

CREATE TABLE Productos (
id INT PRIMARY KEY,
Nombre VARCHAR(50),
Cantidad INT,
Precio FLOAT,
Stock INT
);

CREATE TABLE Compras (
id INT PRIMARY KEY,
id_Productos INT FOREIGN KEY,
id_Usuarios INT FOREIGN KEY,
Estado BOOLEAN,
Metodo_de_pago INT,
Hora_Entrega TIME,
Hora_Compra TIME
);

CREATE TABLE UsuariosRoles (
id INT PRIMARY KEY,
id_Usuario INT FOREIGN KEY,
id_Roles INT FOREIGN KEY
);

CREATE TABLE Roles (
id INT PRIMARY KEY,
Nombre_Rol VARCHAR(50),
);