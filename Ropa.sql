comando backup

mysqldump -h 10.9.120.5 -P 3307 -u ropauba -p ropauba > ropauba_backup.sql


CREATE USER 'DanielCufos'@'%' IDENTIFIED BY 'ropauba';
CREATE USER 'javierromualdo2006'@'%' IDENTIFIED BY 'ropauba';

GRANT ALL PRIVILEGES ON ropauba.* TO 'DanielCufos'@'%';
GRANT ALL PRIVILEGES ON ropauba.* TO 'javierromualdo2006'@'%';

CREATE TABLE Publicaciones (
    id INT PRIMARY KEY,
    id_Usuarios INT,
    id_Productos INT,
    Titulo VARCHAR(50),
    Imagen VARCHAR(200),
    Descripcion TEXT,
    FOREIGN KEY (id_Usuarios) REFERENCES Usuarios(id),
    FOREIGN KEY (id_Productos) REFERENCES Productos(id)
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
    id_Productos INT,
    id_Usuarios INT,
    Estado BOOLEAN,
    Metodo_de_pago INT,
    Hora_Entrega TIME,
    Hora_Compra TIME,
    FOREIGN KEY (id_Productos) REFERENCES Productos(id),
    FOREIGN KEY (id_Usuarios) REFERENCES Usuarios(id)
);

CREATE TABLE UsuariosRoles (
    id INT PRIMARY KEY,
    id_Usuario INT,
    id_Roles INT,
    FOREIGN KEY (id_Usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_Roles) REFERENCES Roles(id)
);

CREATE TABLE Roles (
    id INT PRIMARY KEY,
    Nombre_Rol VARCHAR(50)
);

//////////////////////////////////PRODUCTOS//////////////////////////////////

INSERT INTO `Productos`(`Nombre`, `Cantidad`, `Precio`, `Stock`) VALUES 
('Zapatillas Air Force Blancas', 50, 80.00, 200),
('Camiseta Nike Dri-FIT', 30, 25.00, 150),
('Pantalones Adidas Originals', 20, 60.00, 100),
('Chaqueta Puma Essentials', 15, 90.00, 75),
('Sudadera Under Armour', 25, 45.00, 120),
('Botas Timberland Clásicas', 10, 150.00, 50),
('Gorra New Era 9FIFTY', 40, 30.00, 180);


/////////////////////////////////////////////////////////////////////////////

