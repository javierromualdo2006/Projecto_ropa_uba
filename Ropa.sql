comando backup

mysqldump -h 10.9.120.5 -P 3307 -u ropauba -p ropauba > ropauba_backup.sql


CREATE USER 'DanielCufos'@'%' IDENTIFIED BY 'ropauba';
CREATE USER 'javierromualdo2006'@'%' IDENTIFIED BY 'ropauba';

GRANT ALL PRIVILEGES ON ropauba.* TO 'DanielCufos'@'%';
GRANT ALL PRIVILEGES ON ropauba.* TO 'javierromualdo2006'@'%';

//////////TABLAS////////////

CREATE TABLE Pago (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Metodo_de_pago VARCHAR(50)
);


CREATE TABLE Publicaciones (
    id INT PRIMARY KEY,
    id_Usuarios INT,
    id_Productos INT,
    Titulo VARCHAR(50),
    Imagen TEXT,
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
    FOREIGN KEY (id_Pago) REFERENCES Pago(id),
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

<<<<<<< HEAD
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
=======
////////INSERTS////////

INSERT INTO `Usuarios`(`Nombre`, `Apellido`, `Correo`, `Numero_de_Telefono`, `Direccion`)
VALUES
('Javier', 'Romualdo', 'javieragustinromualdo2006@gmail.com', '11223344', 'my house'),
('Daniel', 'Cufos', 'danielcufos111@gmail.com', '146723466', 'Mi casa B'),
('Carlos', 'Ramírez', 'carlos.ramirez@email.com', '55559876', 'Boulevard de los Sueños 789'),
('Ana', 'López', 'ana.lopez@email.com', '55554321', 'Plaza Mayor 101'),
('Luis', 'Fernández', 'luis.fernandez@email.com', '55558765', 'Calle Real 202'),
('Sofía', 'Martínez', 'sofia.martinez@email.com', '55551357', 'Calle de la Luna 303'),
('Javier', 'Hernández', 'javier.hernandez@email.com', '55552468', 'Camino del Sol 404'),
('Lucía', 'Díaz', 'lucia.diaz@email.com', '55559753', 'Avenida Libertad 505'),
('Miguel', 'Sánchez', 'miguel.sanchez@email.com', '55558642', 'Calle Esperanza 606'),
('Elena', 'Torres', 'elena.torres@email.com', '55557531', 'Camino de los Vientos 707'),
('Andrés', 'Moreno', 'andres.moreno@email.com', '55554826', 'Calle del Parque 808'),
('Valeria', 'Castro', 'valeria.castro@email.com', '55553697', 'Avenida del Valle 909');


INSERT INTO `Roles`(`Nombre_Rol`) 
VALUES 
('Administrador'),
('Moderador'),
('Usuario')


INSERT INTO `UsuariosRoles`(`id_Usuario`, `id_Roles`) 
VALUES 
(1, 1),
(2, 1), 
(3, 3), 
(4, 3), 
(5, 3), 
(6, 3), 
(7, 3), 
(8, 3), 
(9, 3), 
(10, 3), 
(11, 3), 
(12, 3);

INSERT INTO 
`Compras`
(`id_Productos`, `id_Usuarios`, `Estado`, `Metodo_de_pago`, `Hora_Entrega`, `Hora_Compra`)
 VALUES 
 (1, 3, TRUE, 1, '14:30:00', '10:00:00'), 
 (2, 4, FALSE, 2, '16:00:00', '11:15:00'), 
 (3, 5, TRUE, 3, '12:45:00', '09:30:00'), 
 (1, 6, TRUE, 1, '17:00:00', '13:00:00'), 
 (6, 7, FALSE, 2, '18:30:00', '15:45:00'), 
 (4, 8, TRUE, 3, '20:00:00', '16:20:00'), 
 (3, 9, FALSE, 1, '19:15:00', '12:10:00'), 
 (2, 10, TRUE, 2, '21:00:00', '14:50:00');

INSERT INTO `Pago`(`id`, `Metodo_de_pago`) 
VALUES 
(1 ,'Efectivo'),
(2 ,'Credito')

INSERT INTO `Publicaciones`(`id_Usuarios`, `id_Productos`, `Titulo`, `Imagen`, `Descripcion`) 
VALUES 
(2, 1, 'El Auto de Colapinto', 'https://imgs.search.brave.com/Egemw8U3x1QlaXP-TXuizjIzx29WMBde_N_edjYXTJU/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMucGFnaW5hMTIu/Y29tLmFyL3N0eWxl/cy9mb2NhbF8zXzJf/OTYweDY0MC9wdWJs/aWMvMjAyNC0wOS84/NzMyMDEtMDAwLTM2/Zzc4dGYuanBnP2g9/YzM2MzVmYTImaXRv/az0zM0tUODNNYw', 'Descripción de la publicación 1'), 
(4, 2, 'Los guantes de Tyson firmados', 'https://imgs.search.brave.com/821HJjXltozC9JYK-rr_EBttxJpzPtGCH-sg8lETMAI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NTFUQ1VpZ2lzUEwu/anBn', 'Guantes Title dorados firmados por mike tyson'), 
(5, 3, 'Publicación 3', 'imagen3.jpg', 'Descripción de la publicación 3'), 
(6, 4, 'Publicación 4', 'imagen4.jpg', 'Descripción de la publicación 4'), 
(7, 5, 'Publicación 5', 'imagen5.jpg', 'Descripción de la publicación 5');
>>>>>>> 845e6e67c5dcc7ce3265ad9985de499bd0e3a89e


///////////////////MODIFICACIONES/////////////////////////

ALTER TABLE UsuariosRoles 
DROP COLUMN id;

ALTER TABLE Compras
DROP COLUMN estado;