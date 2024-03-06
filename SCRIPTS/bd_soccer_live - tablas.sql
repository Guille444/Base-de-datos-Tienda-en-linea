DROP DATABASE IF EXISTS db_soccer_live;

CREATE DATABASE db_soccer_live;

USE db_soccer_live;

CREATE TABLE empleados(
id_empleado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_empleadp VARCHAR(50) NOT NULL,
apellido_empleado VARCHAR(50) NOT NULL,
telefono_empleado VARCHAR(9) NOT NULL,
dui_empleado VARCHAR(10) NOT NULL,
clave_empleado VARCHAR(64) NOT NULL,
correo_empleado VARCHAR(100) NOT NULL,
imagen_empleado VARCHAR(25) NOT NULL
);

DESCRIBE empleados;

ALTER TABLE empleados
ADD CONSTRAINT chk_dui_empleado CHECK (dui_empleado REGEXP '^[0-9]{8}-[0-9]{1}$');

ALTER TABLE empleados
ADD CONSTRAINT chk_telefono_empleado CHECK (telefono_empleado REGEXP '^[0-9]{4}-[0-9]{4}$');

ALTER TABLE empleados
ADD CONSTRAINT chk_correo_empleado CHECK (correo_empleado REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$');

CREATE TABLE categorias(
id_categoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion_categoria VARCHAR(150) NOT NULL,
imagen_categoria VARCHAR(25) NOT NULL
);

DESCRIBE categorias;

CREATE TABLE marcas(
id_marca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
correo_marca VARCHAR(100) NOT NULL,
telefono_marca VARCHAR(9),
imagen_marca VARCHAR(25)
);

DESCRIBE marcas;

ALTER TABLE marcas
ADD CONSTRAINT chk_telefono_marca CHECK (telefono_marca REGEXP '^[0-9]{4}-[0-9]{4}$');

ALTER TABLE marcas
ADD CONSTRAINT chk_correo_marca CHECK (correo_marca REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$');

CREATE TABLE productos(
id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_categoria INT NOT NULL,
CONSTRAINT fk_producto_categoria
FOREIGN KEY (id_categoria)
REFERENCES categorias (id_categoria),
id_marca INT NOT NULL,
CONSTRAINT fk_producto_marca
FOREIGN KEY (id_marca)
REFERENCES marcas (id_marca),
nombre_producto VARCHAR(50) NOT NULL,
estado_producto BOOLEAN NOT NULL,
precio_producto NUMERIC(5,2) NOT NULL,
descripcion_producto VARCHAR(150),
imagen_producto VARCHAR(25) NOT NULL
);

DESCRIBE productos;

ALTER TABLE productos
ADD CONSTRAINT chk_precio_positivo CHECK (precio_producto > 0);

CREATE TABLE clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_cliente VARCHAR(50) NOT NULL,
apellido_cliente VARCHAR(50) NOT NULL,
direccion_cliente VARCHAR(250) NOT NULL,
telefono_cliente VARCHAR(10) NOT NULL,
correo_cliente VARCHAR(100) NOT NULL,
clave_cliente VARCHAR(64) NOT NULL,
estado_cliente BOOLEAN NOT NULL
);

DESCRIBE clientes;

ALTER TABLE clientes
ADD CONSTRAINT chk_telefono_cliente CHECK (telefono_cliente REGEXP '^[0-9]{4}-[0-9]{4}$');

ALTER TABLE clientes
ADD CONSTRAINT chk_correo_cliente CHECK (correo_cliente REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$');

CREATE TABLE pedidos(
id_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_cliente INT NOT NULL,
CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente),
direccion_pedido VARCHAR(250) NOT NULL,
fecha_pedido DATE NOT NULL,
estado_pedido ENUM('Enviado', 'En proceso', 'Recibido') NOT NULL
);

DESCRIBE pedidos;

CREATE TABLE tallas(
id_talla INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
talla VARCHAR(2) NOT NULL
);
 
 DESCRIBE tallas;
 
CREATE TABLE detalles_productos(
id_detalle_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_producto INT NOT NULL,
CONSTRAINT fk_detalle_producto_producto
FOREIGN KEY (id_producto)
REFERENCES productos (id_producto),
id_talla INT NOT NULL,
CONSTRAINT fk_detalle_producto_talla
FOREIGN KEY (id_talla)
REFERENCES tallas (id_talla),
existencia_producto INT NOT NULL
);

DESCRIBE detalles_productos;

ALTER TABLE detalles_productos
ADD CONSTRAINT chk_existencia_positiva CHECK (existencia_producto >= 0);

CREATE TABLE detalles_pedidos(
id_detalle_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_pedido INT NOT NULL,
CONSTRAINT fk_detalle_pedido_pedido
FOREIGN KEY (id_pedido)
REFERENCES pedidos (id_pedido),
id_detalle_producto INT NOT NULL,
CONSTRAINT fk_detalle_pedido_producto
FOREIGN KEY (id_detalle_producto)
REFERENCES detalles_productos (id_detalle_producto),
cantidad_producto INT NOT NULL,
precio_unitario NUMERIC(5,2) NOT NULL
);

DESCRIBE detalles_pedidos;

ALTER TABLE detalles_pedidos
ADD CONSTRAINT chk_cantidad_positiva CHECK (cantidad_producto >= 0);

ALTER TABLE detalles_pedidos
ADD CONSTRAINT chk_precio_unitario_positivo CHECK (precio_unitario > 0);

CREATE TABLE valoraciones(
id_reseña INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_detalle_pedido INT NOT NULL,
descripcion_reseña VARCHAR(250) NOT NULL,
fecha_valoracion DATE NOT NULL,
estado_valoracion ENUM('Activa', 'Desactiva') NOT NULL
);

DESCRIBE valoraciones;

/*INSERTS*/
