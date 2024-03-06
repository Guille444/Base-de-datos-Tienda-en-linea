DROP DATABASE IF EXISTS db_soccer_live;

CREATE DATABASE db_soccer_live;

USE db_soccer_live;

CREATE TABLE empleados(
id_empleado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_empleado VARCHAR(50) NOT NULL,
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
nombre_marca VARCHAR(50) NOT NULL,
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

SHOW TABLES;

/*INSERTS*/
INSERT INTO empleados (nombre_empleado, apellido_empleado, telefono_empleado, dui_empleado, clave_empleado, correo_empleado, imagen_empleado) VALUES
('Juan', 'García', '1234-5678', '12345678-9', 'clave123', 'juan@gmail.com', 'imagen1.jpg'),
('María', 'López', '2345-6789', '23456789-0', 'clave456', 'maria@gmail.com', 'imagen2.jpg'),
('Pedro', 'Martínez', '3456-7890', '34567890-1', 'clave789', 'pedro@gmail.com', 'imagen3.jpg'),
('Ana', 'Rodríguez', '4567-8901', '45678901-2', 'clave321', 'ana@gmail.com', 'imagen4.jpg'),
('David', 'Gómez', '5678-9012', '56789012-3', 'clave654', 'david@gmail.com', 'imagen5.jpg'),
('Laura', 'Pérez', '6789-0123', '67890123-4', 'clave987', 'laura@gmail.com', 'imagen6.jpg'),
('Carlos', 'Sánchez', '7890-1234', '78901234-5', 'clave123', 'carlos@gmail.com', 'imagen7.jpg'),
('Sofía', 'Gutiérrez', '8901-2345', '89012345-6', 'clave456', 'sofia@gmail.com', 'imagen8.jpg'),
('Luis', 'Hernández', '9012-3456', '90123456-7', 'clave789', 'luis@gmail.com', 'imagen9.jpg'),
('Lucía', 'Díaz', '0123-4567', '01234567-8', 'clave321', 'lucia@gmail.com', 'imagen10.jpg'),
('Javier', 'Fernández', '1122-3344', '11223344-5', 'clave654', 'javier@gmail.com', 'imagen11.jpg'),
('Paula', 'García', '2233-4455', '22334455-6', 'clave987', 'paula@gmail.com', 'imagen12.jpg'),
('Miguel', 'López', '3344-5566', '33445566-7', 'clave123', 'miguel@gmail.com', 'imagen13.jpg'),
('Elena', 'Martínez', '4455-6677', '44556677-8', 'clave456', 'elena@gmail.com', 'imagen14.jpg'),
('Diego', 'Rodríguez', '5566-7788', '55667788-9', 'clave789', 'diego@gmail.com', 'imagen15.jpg'),
('Marina', 'Gómez', '6677-8899', '66778899-0', 'clave321', 'marina@gmail.com', 'imagen16.jpg'),
('Pablo', 'Pérez', '7788-9900', '77889900-1', 'clave654', 'pablo@gmail.com', 'imagen17.jpg'),
('Andrea', 'Sánchez', '8899-0011', '88990011-2', 'clave987', 'andrea@gmail.com', 'imagen18.jpg'),
('Carlos', 'Hernández', '9900-1122', '99001122-3', 'clave123', 'carlos2@gmail.com', 'imagen19.jpg'),
('Carmen', 'Díaz', '0011-2233', '00112233-4', 'clave456', 'carmen@gmail.com', 'imagen20.jpg'),
('Roberto', 'Fernández', '1122-3344', '11223344-5', 'clave789', 'roberto@gmail.com', 'imagen21.jpg'),
('Natalia', 'García', '2233-4455', '22334455-6', 'clave321', 'natalia@gmail.com', 'imagen22.jpg'),
('Eduardo', 'López', '3344-5566', '33445566-7', 'clave654', 'eduardo@gmail.com', 'imagen23.jpg'),
('Clara', 'Martínez', '4455-6677', '44556677-8', 'clave987', 'clara@gmail.com', 'imagen24.jpg'),
('Jorge', 'Rodríguez', '5566-7788', '55667788-9', 'clave123', 'jorge@gmail.com', 'imagen25.jpg');

SELECT * FROM empleados;

INSERT INTO categorias (nombre_categoria, descripcion_categoria, imagen_categoria) VALUES
('Camisetas', 'Camisetas oficiales de equipos de fútbol de diferentes ligas y selecciones nacionales.', 'camisetas.jpg'),
('Balones', 'Balones de fútbol de alta calidad para entrenamiento y competición.', 'balones.jpg'),
('Botines', 'Botines diseñados para mejorar el rendimiento y la comodidad en el campo de juego.', 'botines.jpg'),
('Medias', 'Medias de fútbol de diversos colores y tallas para complementar el uniforme.', 'medias.jpg'),
('Guantes de Portero', 'Guantes de portero profesionales con tecnología de agarre y protección avanzada.', 'guantes.jpg'),
('Accesorios de Entrenamiento', 'Accesorios de entrenamiento como conos, vallas y escaleras de agilidad.', 'accesorios.jpg'),
('Protección', 'Equipamiento de protección como espinilleras, coderas y tobilleras.', 'proteccion.jpg'),
('Bolsas y Maletas', 'Bolsas de deporte y maletas diseñadas para transportar el equipo de fútbol.', 'bolsas.jpg'),
('Equipamiento de Arquero', 'Equipamiento especializado para porteros, incluyendo jerseys y pantalones acolchados.', 'arquero.jpg'),
('Entrenadores', 'Productos para el entrenamiento táctico, incluyendo pizarras y planificadores.', 'entrenadores.jpg'),
('Ropa Casual', 'Ropa casual con temática de fútbol, como camisetas y sudaderas.', 'ropa_casual.jpg'),
('Bandas Capitán', 'Bandas capitán en diferentes colores y diseños para identificar a los líderes del equipo.', 'bandas_capitan.jpg'),
('Equipos de Portería', 'Porterías de fútbol portátiles y fijas para entrenamiento y competición.', 'porterias.jpg'),
('Conjuntos de Entrenamiento', 'Conjuntos de ropa deportiva para entrenamiento con pantalón y sudadera.', 'conjuntos.jpg'),
('Redes de Portería', 'Redes de repuesto para porterías de fútbol en diferentes tamaños y materiales.', 'redes.jpg'),
('Calzado Casual', 'Calzado casual inspirado en el fútbol para uso diario.', 'calzado_casual.jpg'),
('Equipamiento Médico', 'Equipamiento médico básico para el tratamiento de lesiones menores en el campo.', 'equipamiento_medico.jpg'),
('Fundas para Botines', 'Fundas para proteger los botines de fútbol y mantenerlos en buen estado.', 'fundas_botines.jpg'),
('Equipos de Rehabilitación', 'Equipos y accesorios para la rehabilitación de lesiones deportivas.', 'rehabilitacion.jpg'),
('Vestimenta para Árbitros', 'Vestimenta oficial para árbitros de fútbol, incluyendo camisetas y pantalones.', 'arbitros.jpg'),
('Cintas para Cabeza', 'Cintas elásticas para sostener el cabello durante el juego.', 'cintas_cabeza.jpg'),
('Pelotas de Entrenamiento', 'Pelotas de fútbol diseñadas específicamente para el entrenamiento.', 'pelotas_entrenamiento.jpg'),
('Marcadores de Campo', 'Marcadores y conos para delimitar áreas de entrenamiento y juegos.', 'marcadores_campo.jpg'),
('Botellas de Agua', 'Botellas de agua reutilizables para mantenerse hidratado durante el juego y entrenamiento.', 'botellas_agua.jpg'),
('Equipamiento de Iluminación', 'Equipamiento para iluminar campos de fútbol durante entrenamientos y juegos nocturnos.', 'iluminacion.jpg');

SELECT * FROM categorias;

INSERT INTO marcas (nombre_marca, correo_marca, telefono_marca, imagen_marca) VALUES
('Nike', 'info@nike.com', '1234-5678', 'nike.jpg'),
('Adidas', 'info@adidas.com', '2345-6789', 'adidas.jpg'),
('Puma', 'info@puma.com', '3456-7890', 'puma.jpg'),
('Under Armour', 'info@underarmour.com', '4567-8901', 'underarmour.jpg'),
('New Balance', 'info@newbalance.com', '5678-9012', 'newbalance.jpg'),
('Mitre', 'info@mitre.com', '6789-0123', 'mitre.jpg'),
('Uhlsport', 'info@uhlsport.com', '7890-1234', 'uhlsport.jpg'),
('Hummel', 'info@hummel.com', '8901-2345', 'hummel.jpg'),
('Kelme', 'info@kelme.com', '9012-3456', 'kelme.jpg'),
('Diadora', 'info@diadora.com', '0123-4567', 'diadora.jpg'),
('Kappa', 'info@kappa.com', '1122-3344', 'kappa.jpg'),
('Joma', 'info@joma.com', '2233-4455', 'joma.jpg'),
('Lotto', 'info@lotto.com', '3344-5566', 'lotto.jpg'),
('Reusch', 'info@reusch.com', '4455-6677', 'reusch.jpg'),
('Kempa', 'info@kempa.com', '5566-7788', 'kempa.jpg'),
('Mizuno', 'info@mizuno.com', '6677-8899', 'mizuno.jpg'),
('Errea', 'info@errea.com', '7788-9900', 'errea.jpg'),
('Select', 'info@select.com', '8899-0011', 'select.jpg'),
('Luanvi', 'info@luanvi.com', '9900-1122', 'luanvi.jpg'),
('Macron', 'info@macron.com', '0011-2233', 'macron.jpg'),
('Kipsta', 'info@kipsta.com', '1122-3344', 'kipsta.jpg'),
('Jako', 'info@jako.com', '2233-4455', 'jako.jpg'),
('Uhlsport', 'info@uhlsport.com', '3344-5566', 'uhlsport2.jpg'),
('Mitre', 'info@mitre.com', '4455-6677', 'mitre2.jpg'),
('Ricaldone', 'info@rical.com', '7485-8547', 'rical.jpg');

SELECT * FROM marcas;

INSERT INTO productos (id_categoria, id_marca, nombre_producto, estado_producto, precio_producto, descripcion_producto, imagen_producto) VALUES
(1, 1, 'Camiseta Barcelona FC 2023', 1, 59.99, 'Réplica de la camiseta oficial del Barcelona FC para la temporada 2023.', 'camiseta_barcelona.jpg'),
(1, 2, 'Camiseta Real Madrid 2023', 1, 64.99, 'Réplica de la camiseta oficial del Real Madrid para la temporada 2023.', 'camiseta_real_madrid.jpg'),
(1, 3, 'Camiseta Manchester United 2023', 1, 59.99, 'Réplica de la camiseta oficial del Manchester United para la temporada 2023.', 'camiseta_man_united.jpg'),
(2, 4, 'Balón Nike Strike Premier League', 1, 29.99, 'Balón oficial de la Premier League diseñado para un toque preciso y durabilidad.', 'balon_nike_premier.jpg'),
(2, 5, 'Balón Adidas Copa Mundial', 1, 24.99, 'Balón clásico de Adidas utilizado en la Copa Mundial de la FIFA, con diseño duradero y excelente tacto.', 'balon_adidas_copa.jpg'),
(3, 6, 'Botines Nike Mercurial Superfly', 1, 179.99, 'Botines de fútbol diseñados para velocidad y tracción en terrenos firmes.', 'botines_nike_mercurial.jpg'),
(3, 7, 'Botines Adidas Predator Freak', 1, 159.99, 'Botines de fútbol con tecnología Demonskin para un mejor control y precisión en el golpeo.', 'botines_adidas_predator.jpg'),
(4, 8, 'Medias Nike Performance', 1, 14.99, 'Medias de fútbol Nike con tejido transpirable y soporte en el arco.', 'medias_nike.jpg'),
(4, 9, 'Medias Adidas Milano 16', 1, 12.99, 'Medias clásicas de Adidas con acolchado en zonas clave para mayor comodidad.', 'medias_adidas.jpg'),
(5, 10, 'Guantes de Portero Reusch Attrakt', 1, 89.99, 'Guantes de portero con tecnología Grip Latex para un agarre superior en todas las condiciones.', 'guantes_reusch_attrakt.jpg'),
(5, 11, 'Guantes de Portero Uhlsport Radar Control', 1, 79.99, 'Guantes de portero con corte negativo y látex ABSOLUTGRIP para un excelente agarre.', 'guantes_uhlsport_radar.jpg'),
(6, 12, 'Espinilleras Nike Mercurial Lite', 1, 24.99, 'Espinilleras ligeras con cobertura anatómica para un ajuste cómodo y seguro.', 'espinilleras_nike_mercurial.jpg'),
(6, 13, 'Espinilleras Adidas Ghost Club', 1, 19.99, 'Espinilleras con diseño flexible y acolchado EVA para una protección ligera.', 'espinilleras_adidas_ghost.jpg'),
(7, 14, 'Conjunto de Entrenamiento Nike Dry Academy', 1, 69.99, 'Conjunto de sudadera y pantalón Nike Dri-FIT para entrenamientos cómodos y secos.', 'conjunto_nike_dry_academy.jpg'),
(7, 15, 'Conjunto de Entrenamiento Adidas Tiro 21', 1, 64.99, 'Conjunto de chaqueta y pantalón Adidas con tecnología AEROREADY para mantenerte fresco y seco.', 'conjunto_adidas_tiro.jpg'),
(8, 16, 'Red para Portería de Fútbol Mitre', 1, 39.99, 'Red de repuesto para porterías de fútbol Mitre, fabricada con material resistente.', 'red_porteria_mitre.jpg'),
(8, 17, 'Red para Portería de Fútbol Select', 1, 34.99, 'Red de repuesto para porterías de fútbol Select, disponible en varios tamaños.', 'red_porteria_select.jpg'),
(9, 18, 'Camiseta de Entrenamiento Nike Park VI', 1, 24.99, 'Camiseta de entrenamiento Nike con tejido transpirable y cuello en V.', 'camiseta_entrenamiento_nike.jpg'),
(9, 19, 'Camiseta de Entrenamiento Adidas Core 18', 1, 19.99, 'Camiseta de entrenamiento Adidas con diseño clásico y tejido ligero.', 'camiseta_entrenamiento_adidas.jpg'),
(10, 20, 'Balón de Entrenamiento Select Numero 10', 1, 19.99, 'Balón de entrenamiento duradero y resistente al agua, ideal para uso diario.', 'balon_entrenamiento_select.jpg'),
(10, 21, 'Balón de Entrenamiento Jako Light', 1, 17.99, 'Balón ligero con superficie texturizada para un mejor control y toque.', 'balon_entrenamiento_jako.jpg'),
(11, 22, 'Botines Macron Academy', 1, 49.99, 'Botines de fútbol para jóvenes jugadores, con suela multitaco para agarre en césped natural.', 'botines_macron_academy.jpg'),
(11, 23, 'Botines Kipsta Agility 500', 1, 39.99, 'Botines diseñados para agilidad y comodidad en terrenos secos y firmes.', 'botines_kipsta_agility.jpg'),
(12, 24, 'Gorra Nike Legacy 91', 1, 19.99, 'Gorra deportiva Nike con tecnología Dri-FIT para mantenerte fresco y seco.', 'gorra_nike_legacy.jpg'),
(12, 25, 'Gorra Adidas Climalite', 1, 17.99, 'Gorra deportiva Adidas con tejido transpirable y cierre ajustable.', 'gorra_adidas_climalite.jpg');

SELECT * FROM productos;

INSERT INTO clientes (nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente, correo_cliente, clave_cliente, estado_cliente) VALUES
('Juan', 'Pérez', 'Calle Principal #123', '7890-1234', 'juan@gmail.com', 'clavejuan123', 1),
('María', 'González', 'Avenida Central #456', '6789-2345', 'maria@gmail.com', 'mariag123', 1),
('Pedro', 'Rodríguez', 'Calle Secundaria #789', '5678-3456', 'pedro@gmail.com', 'pedrorod321', 1),
('Ana', 'Martínez', 'Avenida Norte #1011', '4567-4567', 'ana@gmail.com', 'anamar123', 1),
('Luis', 'Sánchez', 'Calle Sur #1213', '3456-5678', 'luis@gmail.com', 'luisan456', 1),
('Laura', 'Hernández', 'Avenida Este #1415', '2345-6789', 'laura@gmail.com', 'laurah123', 1),
('Carlos', 'López', 'Calle Oeste #1617', '1234-7890', 'carlos@gmail.com', 'carlosl567', 1),
('Sofía', 'Díaz', 'Avenida Central #1819', '0123-8901', 'sofia@gmail.com', 'sofiad123', 1),
('Javier', 'Torres', 'Calle Principal #2021', '9012-3456', 'javier@gmail.com', 'javiert123', 1),
('Valeria', 'Ruiz', 'Avenida Norte #2223', '8901-2345', 'valeria@gmail.com', 'valeriar321', 1),
('Diego', 'Gómez', 'Calle Sur #2425', '7890-1234', 'diego@gmail.com', 'diegor789', 1),
('Paula', 'Fernández', 'Avenida Este #2627', '6789-2345', 'paula@gmail.com', 'paulaf123', 1),
('Alejandro', 'Martín', 'Calle Oeste #2829', '5678-3456', 'alejandro@gmail.com', 'alejandrom123', 1),
('Andrea', 'Jiménez', 'Avenida Central #3031', '4567-4567', 'andrea@gmail.com', 'andreaj789', 1),
('Miguel', 'López', 'Calle Principal #3233', '3456-5678', 'miguel@gmail.com', 'miguell567', 1),
('Natalia', 'Pérez', 'Avenida Norte #3435', '2345-6789', 'natalia@gmail.com', 'nataliap123', 1),
('Martín', 'Gutiérrez', 'Calle Sur #3637', '1234-7890', 'martin@gmail.com', 'marting123', 1),
('Valentina', 'Sánchez', 'Avenida Este #3839', '0123-8901', 'valentina@gmail.com', 'valentinas567', 1),
('Lucas', 'Díaz', 'Calle Oeste #4041', '9012-3456', 'lucas@gmail.com', 'lucasd123', 1),
('Camila', 'Muñoz', 'Avenida Central #4243', '8901-2345', 'camila@gmail.com', 'camilam567', 1),
('Mateo', 'Alvarez', 'Calle Principal #4445', '7890-1234', 'mateo@gmail.com', 'mateoa123', 1),
('Isabella', 'Romero', 'Avenida Norte #4647', '6789-2345', 'isabella@gmail.com', 'isabellar789', 1),
('Daniel', 'Hernández', 'Calle Sur #4849', '5678-3456', 'daniel@gmail.com', 'danielh123', 1),
('Fernanda', 'Vargas', 'Avenida Este #5051', '4567-4567', 'fernanda@gmail.com', 'fernandav123', 1),
('Santiago', 'Gómez', 'Calle Oeste #5253', '3456-5678', 'santiago@gmail.com', 'santiagog567', 1);

SELECT * FROM clientes;

INSERT INTO pedidos (id_cliente, direccion_pedido, fecha_pedido, estado_pedido) VALUES
(1, '123 Calle Principal, Ciudad', '2024-03-06', 'Enviado'),
(2, '456 Avenida Central, Pueblo', '2024-03-06', 'En proceso'),
(3, '789 Calle Secundaria, Villa', '2024-03-05', 'Recibido'),
(4, '012 Avenida Norte, Pueblo', '2024-03-05', 'Enviado'),
(5, '345 Calle Este, Ciudad', '2024-03-04', 'Recibido'),
(6, '678 Avenida Oeste, Villa', '2024-03-04', 'Enviado'),
(7, '901 Calle Principal, Ciudad', '2024-03-03', 'En proceso'),
(8, '234 Avenida Central, Pueblo', '2024-03-03', 'Recibido'),
(9, '567 Calle Secundaria, Villa', '2024-03-02', 'Enviado'),
(10, '890 Avenida Norte, Pueblo', '2024-03-02', 'En proceso'),
(11, '123 Calle Este, Ciudad', '2024-03-01', 'Recibido'),
(12, '456 Avenida Oeste, Villa', '2024-03-01', 'Enviado'),
(13, '789 Calle Principal, Ciudad', '2024-02-29', 'En proceso'),
(14, '012 Avenida Central, Pueblo', '2024-02-29', 'Recibido'),
(15, '345 Calle Secundaria, Villa', '2024-02-28', 'Enviado'),
(16, '678 Avenida Norte, Pueblo', '2024-02-28', 'En proceso'),
(17, '901 Calle Este, Ciudad', '2024-02-27', 'Recibido'),
(18, '234 Avenida Oeste, Villa', '2024-02-27', 'Enviado'),
(19, '567 Calle Principal, Ciudad', '2024-02-26', 'En proceso'),
(20, '890 Avenida Central, Pueblo', '2024-02-26', 'Recibido'),
(21, '123 Calle Secundaria, Villa', '2024-02-25', 'Enviado'),
(22, '456 Avenida Norte, Pueblo', '2024-02-25', 'En proceso'),
(23, '789 Calle Este, Ciudad', '2024-02-24', 'Recibido'),
(24, '012 Avenida Oeste, Villa', '2024-02-24', 'Enviado'),
(25, '345 Calle Principal, Ciudad', '2024-02-23', 'En proceso');

SELECT * FROM pedidos;

INSERT INTO tallas (talla) VALUES
('35'),
('36'),
('37'),
('38'),
('39'),
('40'),
('41'),
('42'),
('43'),
('44'),
('45'),
('46'),
('47'),
('48'),
('49'),
('50'),
('51'),
('52'),
('53'),
('54'),
('55'),
('56'),
('57'),
('58'),
('59');

SELECT * FROM marcas;

INSERT INTO detalles_productos (id_producto, id_talla, existencia_producto) VALUES
(1, 1, 50),
(1, 2, 30),
(1, 3, 20),
(2, 2, 40),
(2, 3, 25),
(3, 1, 35),
(3, 3, 15),
(4, 2, 20),
(4, 4, 10),
(5, 3, 25),
(5, 4, 15),
(6, 1, 40),
(6, 2, 30),
(7, 3, 20),
(7, 4, 25),
(8, 1, 30),
(8, 2, 20),
(9, 1, 25),
(9, 2, 15),
(10, 3, 20),
(10, 4, 10),
(11, 1, 35),
(11, 2, 25),
(12, 2, 15),
(12, 3, 10);

SELECT * FROM detalles_productos;

INSERT INTO detalles_pedidos (id_pedido, id_detalle_producto, cantidad_producto, precio_unitario) VALUES
(1, 1, 2, 29.99),
(1, 3, 1, 49.99),
(2, 2, 3, 19.99),
(2, 4, 2, 39.99),
(3, 5, 1, 89.99),
(4, 6, 4, 14.99),
(4, 7, 1, 64.99),
(5, 8, 2, 34.99),
(6, 9, 1, 44.99),
(7, 10, 3, 24.99),
(7, 11, 2, 54.99),
(8, 12, 1, 74.99),
(9, 13, 2, 19.99),
(9, 14, 1, 94.99),
(10, 15, 3, 29.99),
(11, 16, 1, 39.99),
(12, 17, 2, 49.99),
(13, 18, 1, 69.99),
(14, 19, 3, 14.99),
(14, 20, 1, 84.99),
(15, 21, 2, 39.99),
(16, 22, 1, 59.99),
(17, 23, 2, 24.99),
(17, 24, 1, 44.99),
(18, 25, 3, 19.99);

SELECT * FROM detalles_pedidos;

INSERT INTO valoraciones (id_detalle_pedido, descripcion_reseña, fecha_valoracion, estado_valoracion) VALUES
(1, 'Excelente servicio, entrega rápida y producto de alta calidad.', '2024-03-01', 'Activa'),
(2, 'Muy satisfecho con mi compra, el producto cumple con mis expectativas.', '2024-03-02', 'Activa'),
(3, 'Buen servicio al cliente y envío rápido.', '2024-03-03', 'Activa'),
(4, 'El producto llegó dañado, el empaque no era adecuado para protegerlo.', '2024-03-04', 'Activa'),
(5, 'El pedido tardó más de lo esperado en llegar.', '2024-03-05', 'Activa'),
(6, 'Buena calidad de los productos, definitivamente volveré a comprar.', '2024-03-06', 'Activa'),
(7, 'El producto no coincidió con la descripción en el sitio web.', '2024-03-07', 'Activa'),
(8, 'Excelente experiencia de compra, altamente recomendado.', '2024-03-08', 'Activa'),
(9, 'El producto superó mis expectativas, excelente calidad.', '2024-03-09', 'Activa'),
(10, 'El envío llegó antes de lo esperado, muy contento con la rapidez.', '2024-03-10', 'Activa'),
(11, 'Buen servicio al cliente, respondieron rápidamente a mis consultas.', '2024-03-11', 'Activa'),
(12, 'El producto es tal como se describe, muy contento con mi compra.', '2024-03-12', 'Activa'),
(13, 'El proceso de compra fue sencillo y rápido.', '2024-03-13', 'Activa'),
(14, 'El producto tenía defectos de fabricación, no cumplió con mis expectativas.', '2024-03-14', 'Activa'),
(15, 'El envío se retrasó debido a problemas logísticos.', '2024-03-15', 'Activa'),
(16, 'Buen producto, pero el servicio de entrega fue deficiente.', '2024-03-16', 'Activa'),
(17, 'Muy contento con la atención al cliente, resolvieron rápidamente un problema con mi pedido.', '2024-03-17', 'Activa'),
(18, 'El producto llegó en perfectas condiciones y en el tiempo esperado.', '2024-03-18', 'Activa'),
(19, 'El producto es de buena calidad, lo recomendaría a otros.', '2024-03-19', 'Activa'),
(20, 'El envío se realizó con retraso, lo cual fue decepcionante.', '2024-03-20', 'Activa'),
(21, 'El producto es excelente, justo lo que necesitaba.', '2024-03-21', 'Activa'),
(22, 'No estoy satisfecho con la calidad del producto, parece ser de mala fabricación.', '2024-03-22', 'Activa'),
(23, 'El servicio de entrega fue rápido y eficiente.', '2024-03-23', 'Activa'),
(24, 'Buena experiencia de compra en general, volvería a comprar.', '2024-03-24', 'Activa'),
(25, 'El producto llegó con partes faltantes, tuve que contactar al servicio al cliente para resolver el problema.', '2024-03-25', 'Activa');

SELECT * FROM valoraciones;