CREATE DATABASE  IF NOT EXISTS `db_soccer_live` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_soccer_live`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_soccer_live
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion_categoria` varchar(150) NOT NULL,
  `imagen_categoria` varchar(25) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Camisetas','Camisetas oficiales de equipos de fútbol de diferentes ligas y selecciones nacionales.','camisetas.jpg'),(2,'Balones','Balones de fútbol de alta calidad para entrenamiento y competición.','balones.jpg'),(3,'Botines','Botines diseñados para mejorar el rendimiento y la comodidad en el campo de juego.','botines.jpg'),(4,'Medias','Medias de fútbol de diversos colores y tallas para complementar el uniforme.','medias.jpg'),(5,'Guantes de Portero','Guantes de portero profesionales con tecnología de agarre y protección avanzada.','guantes.jpg'),(6,'Accesorios de Entrenamiento','Accesorios de entrenamiento como conos, vallas y escaleras de agilidad.','accesorios.jpg'),(7,'Protección','Equipamiento de protección como espinilleras, coderas y tobilleras.','proteccion.jpg'),(8,'Bolsas y Maletas','Bolsas de deporte y maletas diseñadas para transportar el equipo de fútbol.','bolsas.jpg'),(9,'Equipamiento de Arquero','Equipamiento especializado para porteros, incluyendo jerseys y pantalones acolchados.','arquero.jpg'),(10,'Entrenadores','Productos para el entrenamiento táctico, incluyendo pizarras y planificadores.','entrenadores.jpg'),(11,'Ropa Casual','Ropa casual con temática de fútbol, como camisetas y sudaderas.','ropa_casual.jpg'),(12,'Bandas Capitán','Bandas capitán en diferentes colores y diseños para identificar a los líderes del equipo.','bandas_capitan.jpg'),(13,'Equipos de Portería','Porterías de fútbol portátiles y fijas para entrenamiento y competición.','porterias.jpg'),(14,'Conjuntos de Entrenamiento','Conjuntos de ropa deportiva para entrenamiento con pantalón y sudadera.','conjuntos.jpg'),(15,'Redes de Portería','Redes de repuesto para porterías de fútbol en diferentes tamaños y materiales.','redes.jpg'),(16,'Calzado Casual','Calzado casual inspirado en el fútbol para uso diario.','calzado_casual.jpg'),(17,'Equipamiento Médico','Equipamiento médico básico para el tratamiento de lesiones menores en el campo.','equipamiento_medico.jpg'),(18,'Fundas para Botines','Fundas para proteger los botines de fútbol y mantenerlos en buen estado.','fundas_botines.jpg'),(19,'Equipos de Rehabilitación','Equipos y accesorios para la rehabilitación de lesiones deportivas.','rehabilitacion.jpg'),(20,'Vestimenta para Árbitros','Vestimenta oficial para árbitros de fútbol, incluyendo camisetas y pantalones.','arbitros.jpg'),(21,'Cintas para Cabeza','Cintas elásticas para sostener el cabello durante el juego.','cintas_cabeza.jpg'),(22,'Pelotas de Entrenamiento','Pelotas de fútbol diseñadas específicamente para el entrenamiento.','pelotas_entrenamiento.jpg'),(23,'Marcadores de Campo','Marcadores y conos para delimitar áreas de entrenamiento y juegos.','marcadores_campo.jpg'),(24,'Botellas de Agua','Botellas de agua reutilizables para mantenerse hidratado durante el juego y entrenamiento.','botellas_agua.jpg'),(25,'Equipamiento de Iluminación','Equipamiento para iluminar campos de fútbol durante entrenamientos y juegos nocturnos.','iluminacion.jpg');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `direccion_cliente` varchar(250) NOT NULL,
  `telefono_cliente` varchar(10) NOT NULL,
  `correo_cliente` varchar(100) NOT NULL,
  `clave_cliente` varchar(64) NOT NULL,
  `estado_cliente` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `chk_telefono_cliente` CHECK (`telefono_cliente` regexp '^[0-9]{4}-[0-9]{4}$'),
  CONSTRAINT `chk_correo_cliente` CHECK (`correo_cliente` regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Z|a-z]{2,}$')
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pérez','Calle Principal #123','7890-1234','juan@gmail.com','clavejuan123',1),(2,'María','González','Avenida Central #456','6789-2345','maria@gmail.com','mariag123',1),(3,'Pedro','Rodríguez','Calle Secundaria #789','5678-3456','pedro@gmail.com','pedrorod321',1),(4,'Ana','Martínez','Avenida Norte #1011','4567-4567','ana@gmail.com','anamar123',1),(5,'Luis','Sánchez','Calle Sur #1213','3456-5678','luis@gmail.com','luisan456',1),(6,'Laura','Hernández','Avenida Este #1415','2345-6789','laura@gmail.com','laurah123',1),(7,'Carlos','López','Calle Oeste #1617','1234-7890','carlos@gmail.com','carlosl567',1),(8,'Sofía','Díaz','Avenida Central #1819','0123-8901','sofia@gmail.com','sofiad123',1),(9,'Javier','Torres','Calle Principal #2021','9012-3456','javier@gmail.com','javiert123',1),(10,'Valeria','Ruiz','Avenida Norte #2223','8901-2345','valeria@gmail.com','valeriar321',1),(11,'Diego','Gómez','Calle Sur #2425','7890-1234','diego@gmail.com','diegor789',1),(12,'Paula','Fernández','Avenida Este #2627','6789-2345','paula@gmail.com','paulaf123',1),(13,'Alejandro','Martín','Calle Oeste #2829','5678-3456','alejandro@gmail.com','alejandrom123',1),(14,'Andrea','Jiménez','Avenida Central #3031','4567-4567','andrea@gmail.com','andreaj789',1),(15,'Miguel','López','Calle Principal #3233','3456-5678','miguel@gmail.com','miguell567',1),(16,'Natalia','Pérez','Avenida Norte #3435','2345-6789','natalia@gmail.com','nataliap123',1),(17,'Martín','Gutiérrez','Calle Sur #3637','1234-7890','martin@gmail.com','marting123',1),(18,'Valentina','Sánchez','Avenida Este #3839','0123-8901','valentina@gmail.com','valentinas567',1),(19,'Lucas','Díaz','Calle Oeste #4041','9012-3456','lucas@gmail.com','lucasd123',1),(20,'Camila','Muñoz','Avenida Central #4243','8901-2345','camila@gmail.com','camilam567',1),(21,'Mateo','Alvarez','Calle Principal #4445','7890-1234','mateo@gmail.com','mateoa123',1),(22,'Isabella','Romero','Avenida Norte #4647','6789-2345','isabella@gmail.com','isabellar789',1),(23,'Daniel','Hernández','Calle Sur #4849','5678-3456','daniel@gmail.com','danielh123',1),(24,'Fernanda','Vargas','Avenida Este #5051','4567-4567','fernanda@gmail.com','fernandav123',1),(25,'Santiago','Gómez','Calle Oeste #5253','3456-5678','santiago@gmail.com','santiagog567',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_pedidos`
--

DROP TABLE IF EXISTS `detalles_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_pedidos` (
  `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_detalle_producto` int(11) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `precio_unitario` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `fk_detalle_pedido_pedido` (`id_pedido`),
  KEY `fk_detalle_pedido_producto` (`id_detalle_producto`),
  CONSTRAINT `fk_detalle_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `fk_detalle_pedido_producto` FOREIGN KEY (`id_detalle_producto`) REFERENCES `detalles_productos` (`id_detalle_producto`),
  CONSTRAINT `chk_cantidad_positiva` CHECK (`cantidad_producto` >= 0),
  CONSTRAINT `chk_precio_unitario_positivo` CHECK (`precio_unitario` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedidos`
--

LOCK TABLES `detalles_pedidos` WRITE;
/*!40000 ALTER TABLE `detalles_pedidos` DISABLE KEYS */;
INSERT INTO `detalles_pedidos` VALUES (1,1,1,2,29.99),(2,1,3,1,49.99),(3,2,2,3,19.99),(4,2,4,2,39.99),(5,3,5,1,89.99),(6,4,6,4,14.99),(7,4,7,1,64.99),(8,5,8,2,34.99),(9,6,9,1,44.99),(10,7,10,3,24.99),(11,7,11,2,54.99),(12,8,12,1,74.99),(13,9,13,2,19.99),(14,9,14,1,94.99),(15,10,15,3,29.99),(16,11,16,1,39.99),(17,12,17,2,49.99),(18,13,18,1,69.99),(19,14,19,3,14.99),(20,14,20,1,84.99),(21,15,21,2,39.99),(22,16,22,1,59.99),(23,17,23,2,24.99),(24,17,24,1,44.99),(25,18,25,3,19.99);
/*!40000 ALTER TABLE `detalles_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_productos`
--

DROP TABLE IF EXISTS `detalles_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_productos` (
  `id_detalle_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_talla` int(11) NOT NULL,
  `existencia_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_producto`),
  KEY `fk_detalle_producto_producto` (`id_producto`),
  KEY `fk_detalle_producto_talla` (`id_talla`),
  CONSTRAINT `fk_detalle_producto_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `fk_detalle_producto_talla` FOREIGN KEY (`id_talla`) REFERENCES `tallas` (`id_talla`),
  CONSTRAINT `chk_existencia_positiva` CHECK (`existencia_producto` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_productos`
--

LOCK TABLES `detalles_productos` WRITE;
/*!40000 ALTER TABLE `detalles_productos` DISABLE KEYS */;
INSERT INTO `detalles_productos` VALUES (1,1,1,50),(2,1,2,30),(3,1,3,20),(4,2,2,40),(5,2,3,25),(6,3,1,35),(7,3,3,15),(8,4,2,20),(9,4,4,10),(10,5,3,25),(11,5,4,15),(12,6,1,40),(13,6,2,30),(14,7,3,20),(15,7,4,25),(16,8,1,30),(17,8,2,20),(18,9,1,25),(19,9,2,15),(20,10,3,20),(21,10,4,10),(22,11,1,35),(23,11,2,25),(24,12,2,15),(25,12,3,10);
/*!40000 ALTER TABLE `detalles_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(50) NOT NULL,
  `apellido_empleado` varchar(50) NOT NULL,
  `telefono_empleado` varchar(9) NOT NULL,
  `dui_empleado` varchar(10) NOT NULL,
  `clave_empleado` varchar(64) NOT NULL,
  `correo_empleado` varchar(100) NOT NULL,
  `imagen_empleado` varchar(25) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  CONSTRAINT `chk_dui_empleado` CHECK (`dui_empleado` regexp '^[0-9]{8}-[0-9]{1}$'),
  CONSTRAINT `chk_telefono_empleado` CHECK (`telefono_empleado` regexp '^[0-9]{4}-[0-9]{4}$'),
  CONSTRAINT `chk_correo_empleado` CHECK (`correo_empleado` regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Z|a-z]{2,}$')
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan','García','1234-5678','12345678-9','clave123','juan@gmail.com','imagen1.jpg'),(2,'María','López','2345-6789','23456789-0','clave456','maria@gmail.com','imagen2.jpg'),(3,'Pedro','Martínez','3456-7890','34567890-1','clave789','pedro@gmail.com','imagen3.jpg'),(4,'Ana','Rodríguez','4567-8901','45678901-2','clave321','ana@gmail.com','imagen4.jpg'),(5,'David','Gómez','5678-9012','56789012-3','clave654','david@gmail.com','imagen5.jpg'),(6,'Laura','Pérez','6789-0123','67890123-4','clave987','laura@gmail.com','imagen6.jpg'),(7,'Carlos','Sánchez','7890-1234','78901234-5','clave123','carlos@gmail.com','imagen7.jpg'),(8,'Sofía','Gutiérrez','8901-2345','89012345-6','clave456','sofia@gmail.com','imagen8.jpg'),(9,'Luis','Hernández','9012-3456','90123456-7','clave789','luis@gmail.com','imagen9.jpg'),(10,'Lucía','Díaz','0123-4567','01234567-8','clave321','lucia@gmail.com','imagen10.jpg'),(11,'Javier','Fernández','1122-3344','11223344-5','clave654','javier@gmail.com','imagen11.jpg'),(12,'Paula','García','2233-4455','22334455-6','clave987','paula@gmail.com','imagen12.jpg'),(13,'Miguel','López','3344-5566','33445566-7','clave123','miguel@gmail.com','imagen13.jpg'),(14,'Elena','Martínez','4455-6677','44556677-8','clave456','elena@gmail.com','imagen14.jpg'),(15,'Diego','Rodríguez','5566-7788','55667788-9','clave789','diego@gmail.com','imagen15.jpg'),(16,'Marina','Gómez','6677-8899','66778899-0','clave321','marina@gmail.com','imagen16.jpg'),(17,'Pablo','Pérez','7788-9900','77889900-1','clave654','pablo@gmail.com','imagen17.jpg'),(18,'Andrea','Sánchez','8899-0011','88990011-2','clave987','andrea@gmail.com','imagen18.jpg'),(19,'Carlos','Hernández','9900-1122','99001122-3','clave123','carlos2@gmail.com','imagen19.jpg'),(20,'Carmen','Díaz','0011-2233','00112233-4','clave456','carmen@gmail.com','imagen20.jpg'),(21,'Roberto','Fernández','1122-3344','11223344-5','clave789','roberto@gmail.com','imagen21.jpg'),(22,'Natalia','García','2233-4455','22334455-6','clave321','natalia@gmail.com','imagen22.jpg'),(23,'Eduardo','López','3344-5566','33445566-7','clave654','eduardo@gmail.com','imagen23.jpg'),(24,'Clara','Martínez','4455-6677','44556677-8','clave987','clara@gmail.com','imagen24.jpg'),(25,'Jorge','Rodríguez','5566-7788','55667788-9','clave123','jorge@gmail.com','imagen25.jpg');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(50) NOT NULL,
  `correo_marca` varchar(100) NOT NULL,
  `telefono_marca` varchar(9) DEFAULT NULL,
  `imagen_marca` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_marca`),
  CONSTRAINT `chk_telefono_marca` CHECK (`telefono_marca` regexp '^[0-9]{4}-[0-9]{4}$'),
  CONSTRAINT `chk_correo_marca` CHECK (`correo_marca` regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Z|a-z]{2,}$')
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Nike','info@nike.com','1234-5678','nike.jpg'),(2,'Adidas','info@adidas.com','2345-6789','adidas.jpg'),(3,'Puma','info@puma.com','3456-7890','puma.jpg'),(4,'Under Armour','info@underarmour.com','4567-8901','underarmour.jpg'),(5,'New Balance','info@newbalance.com','5678-9012','newbalance.jpg'),(6,'Mitre','info@mitre.com','6789-0123','mitre.jpg'),(7,'Uhlsport','info@uhlsport.com','7890-1234','uhlsport.jpg'),(8,'Hummel','info@hummel.com','8901-2345','hummel.jpg'),(9,'Kelme','info@kelme.com','9012-3456','kelme.jpg'),(10,'Diadora','info@diadora.com','0123-4567','diadora.jpg'),(11,'Kappa','info@kappa.com','1122-3344','kappa.jpg'),(12,'Joma','info@joma.com','2233-4455','joma.jpg'),(13,'Lotto','info@lotto.com','3344-5566','lotto.jpg'),(14,'Reusch','info@reusch.com','4455-6677','reusch.jpg'),(15,'Kempa','info@kempa.com','5566-7788','kempa.jpg'),(16,'Mizuno','info@mizuno.com','6677-8899','mizuno.jpg'),(17,'Errea','info@errea.com','7788-9900','errea.jpg'),(18,'Select','info@select.com','8899-0011','select.jpg'),(19,'Luanvi','info@luanvi.com','9900-1122','luanvi.jpg'),(20,'Macron','info@macron.com','0011-2233','macron.jpg'),(21,'Kipsta','info@kipsta.com','1122-3344','kipsta.jpg'),(22,'Jako','info@jako.com','2233-4455','jako.jpg'),(23,'Uhlsport','info@uhlsport.com','3344-5566','uhlsport2.jpg'),(24,'Mitre','info@mitre.com','4455-6677','mitre2.jpg'),(25,'Ricaldone','info@rical.com','7485-8547','rical.jpg');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `direccion_pedido` varchar(250) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `estado_pedido` enum('Enviado','En proceso','Recibido') NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente` (`id_cliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'123 Calle Principal, Ciudad','2024-03-06','Enviado'),(2,2,'456 Avenida Central, Pueblo','2024-03-06','En proceso'),(3,3,'789 Calle Secundaria, Villa','2024-03-05','Recibido'),(4,4,'012 Avenida Norte, Pueblo','2024-03-05','Enviado'),(5,5,'345 Calle Este, Ciudad','2024-03-04','Recibido'),(6,6,'678 Avenida Oeste, Villa','2024-03-04','Enviado'),(7,7,'901 Calle Principal, Ciudad','2024-03-03','En proceso'),(8,8,'234 Avenida Central, Pueblo','2024-03-03','Recibido'),(9,9,'567 Calle Secundaria, Villa','2024-03-02','Enviado'),(10,10,'890 Avenida Norte, Pueblo','2024-03-02','En proceso'),(11,11,'123 Calle Este, Ciudad','2024-03-01','Recibido'),(12,12,'456 Avenida Oeste, Villa','2024-03-01','Enviado'),(13,13,'789 Calle Principal, Ciudad','2024-02-29','En proceso'),(14,14,'012 Avenida Central, Pueblo','2024-02-29','Recibido'),(15,15,'345 Calle Secundaria, Villa','2024-02-28','Enviado'),(16,16,'678 Avenida Norte, Pueblo','2024-02-28','En proceso'),(17,17,'901 Calle Este, Ciudad','2024-02-27','Recibido'),(18,18,'234 Avenida Oeste, Villa','2024-02-27','Enviado'),(19,19,'567 Calle Principal, Ciudad','2024-02-26','En proceso'),(20,20,'890 Avenida Central, Pueblo','2024-02-26','Recibido'),(21,21,'123 Calle Secundaria, Villa','2024-02-25','Enviado'),(22,22,'456 Avenida Norte, Pueblo','2024-02-25','En proceso'),(23,23,'789 Calle Este, Ciudad','2024-02-24','Recibido'),(24,24,'012 Avenida Oeste, Villa','2024-02-24','Enviado'),(25,25,'345 Calle Principal, Ciudad','2024-02-23','En proceso');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `estado_producto` tinyint(1) NOT NULL,
  `precio_producto` decimal(5,2) NOT NULL,
  `descripcion_producto` varchar(150) DEFAULT NULL,
  `imagen_producto` varchar(25) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_categoria` (`id_categoria`),
  KEY `fk_producto_marca` (`id_marca`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_producto_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  CONSTRAINT `chk_precio_positivo` CHECK (`precio_producto` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,1,'Camiseta Barcelona FC 2023',1,59.99,'Réplica de la camiseta oficial del Barcelona FC para la temporada 2023.','camiseta_barcelona.jpg'),(2,1,2,'Camiseta Real Madrid 2023',1,64.99,'Réplica de la camiseta oficial del Real Madrid para la temporada 2023.','camiseta_real_madrid.jpg'),(3,1,3,'Camiseta Manchester United 2023',1,59.99,'Réplica de la camiseta oficial del Manchester United para la temporada 2023.','camiseta_man_united.jpg'),(4,2,4,'Balón Nike Strike Premier League',1,29.99,'Balón oficial de la Premier League diseñado para un toque preciso y durabilidad.','balon_nike_premier.jpg'),(5,2,5,'Balón Adidas Copa Mundial',1,24.99,'Balón clásico de Adidas utilizado en la Copa Mundial de la FIFA, con diseño duradero y excelente tacto.','balon_adidas_copa.jpg'),(6,3,6,'Botines Nike Mercurial Superfly',1,179.99,'Botines de fútbol diseñados para velocidad y tracción en terrenos firmes.','botines_nike_mercurial.jp'),(7,3,7,'Botines Adidas Predator Freak',1,159.99,'Botines de fútbol con tecnología Demonskin para un mejor control y precisión en el golpeo.','botines_adidas_predator.j'),(8,4,8,'Medias Nike Performance',1,14.99,'Medias de fútbol Nike con tejido transpirable y soporte en el arco.','medias_nike.jpg'),(9,4,9,'Medias Adidas Milano 16',1,12.99,'Medias clásicas de Adidas con acolchado en zonas clave para mayor comodidad.','medias_adidas.jpg'),(10,5,10,'Guantes de Portero Reusch Attrakt',1,89.99,'Guantes de portero con tecnología Grip Latex para un agarre superior en todas las condiciones.','guantes_reusch_attrakt.jp'),(11,5,11,'Guantes de Portero Uhlsport Radar Control',1,79.99,'Guantes de portero con corte negativo y látex ABSOLUTGRIP para un excelente agarre.','guantes_uhlsport_radar.jp'),(12,6,12,'Espinilleras Nike Mercurial Lite',1,24.99,'Espinilleras ligeras con cobertura anatómica para un ajuste cómodo y seguro.','espinilleras_nike_mercuri'),(13,6,13,'Espinilleras Adidas Ghost Club',1,19.99,'Espinilleras con diseño flexible y acolchado EVA para una protección ligera.','espinilleras_adidas_ghost'),(14,7,14,'Conjunto de Entrenamiento Nike Dry Academy',1,69.99,'Conjunto de sudadera y pantalón Nike Dri-FIT para entrenamientos cómodos y secos.','conjunto_nike_dry_academy'),(15,7,15,'Conjunto de Entrenamiento Adidas Tiro 21',1,64.99,'Conjunto de chaqueta y pantalón Adidas con tecnología AEROREADY para mantenerte fresco y seco.','conjunto_adidas_tiro.jpg'),(16,8,16,'Red para Portería de Fútbol Mitre',1,39.99,'Red de repuesto para porterías de fútbol Mitre, fabricada con material resistente.','red_porteria_mitre.jpg'),(17,8,17,'Red para Portería de Fútbol Select',1,34.99,'Red de repuesto para porterías de fútbol Select, disponible en varios tamaños.','red_porteria_select.jpg'),(18,9,18,'Camiseta de Entrenamiento Nike Park VI',1,24.99,'Camiseta de entrenamiento Nike con tejido transpirable y cuello en V.','camiseta_entrenamiento_ni'),(19,9,19,'Camiseta de Entrenamiento Adidas Core 18',1,19.99,'Camiseta de entrenamiento Adidas con diseño clásico y tejido ligero.','camiseta_entrenamiento_ad'),(20,10,20,'Balón de Entrenamiento Select Numero 10',1,19.99,'Balón de entrenamiento duradero y resistente al agua, ideal para uso diario.','balon_entrenamiento_selec'),(21,10,21,'Balón de Entrenamiento Jako Light',1,17.99,'Balón ligero con superficie texturizada para un mejor control y toque.','balon_entrenamiento_jako.'),(22,11,22,'Botines Macron Academy',1,49.99,'Botines de fútbol para jóvenes jugadores, con suela multitaco para agarre en césped natural.','botines_macron_academy.jp'),(23,11,23,'Botines Kipsta Agility 500',1,39.99,'Botines diseñados para agilidad y comodidad en terrenos secos y firmes.','botines_kipsta_agility.jp'),(24,12,24,'Gorra Nike Legacy 91',1,19.99,'Gorra deportiva Nike con tecnología Dri-FIT para mantenerte fresco y seco.','gorra_nike_legacy.jpg'),(25,12,25,'Gorra Adidas Climalite',1,17.99,'Gorra deportiva Adidas con tejido transpirable y cierre ajustable.','gorra_adidas_climalite.jp');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tallas`
--

DROP TABLE IF EXISTS `tallas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tallas` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `talla` varchar(2) NOT NULL,
  PRIMARY KEY (`id_talla`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tallas`
--

LOCK TABLES `tallas` WRITE;
/*!40000 ALTER TABLE `tallas` DISABLE KEYS */;
INSERT INTO `tallas` VALUES (1,'35'),(2,'36'),(3,'37'),(4,'38'),(5,'39'),(6,'40'),(7,'41'),(8,'42'),(9,'43'),(10,'44'),(11,'45'),(12,'46'),(13,'47'),(14,'48'),(15,'49'),(16,'50'),(17,'51'),(18,'52'),(19,'53'),(20,'54'),(21,'55'),(22,'56'),(23,'57'),(24,'58'),(25,'59');
/*!40000 ALTER TABLE `tallas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoraciones` (
  `id_reseña` int(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_pedido` int(11) NOT NULL,
  `descripcion_reseña` varchar(250) NOT NULL,
  `fecha_valoracion` date NOT NULL,
  `estado_valoracion` enum('Activa','Desactiva') NOT NULL,
  PRIMARY KEY (`id_reseña`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
INSERT INTO `valoraciones` VALUES (1,1,'Excelente servicio, entrega rápida y producto de alta calidad.','2024-03-01','Activa'),(2,2,'Muy satisfecho con mi compra, el producto cumple con mis expectativas.','2024-03-02','Activa'),(3,3,'Buen servicio al cliente y envío rápido.','2024-03-03','Activa'),(4,4,'El producto llegó dañado, el empaque no era adecuado para protegerlo.','2024-03-04','Activa'),(5,5,'El pedido tardó más de lo esperado en llegar.','2024-03-05','Activa'),(6,6,'Buena calidad de los productos, definitivamente volveré a comprar.','2024-03-06','Activa'),(7,7,'El producto no coincidió con la descripción en el sitio web.','2024-03-07','Activa'),(8,8,'Excelente experiencia de compra, altamente recomendado.','2024-03-08','Activa'),(9,9,'El producto superó mis expectativas, excelente calidad.','2024-03-09','Activa'),(10,10,'El envío llegó antes de lo esperado, muy contento con la rapidez.','2024-03-10','Activa'),(11,11,'Buen servicio al cliente, respondieron rápidamente a mis consultas.','2024-03-11','Activa'),(12,12,'El producto es tal como se describe, muy contento con mi compra.','2024-03-12','Activa'),(13,13,'El proceso de compra fue sencillo y rápido.','2024-03-13','Activa'),(14,14,'El producto tenía defectos de fabricación, no cumplió con mis expectativas.','2024-03-14','Activa'),(15,15,'El envío se retrasó debido a problemas logísticos.','2024-03-15','Activa'),(16,16,'Buen producto, pero el servicio de entrega fue deficiente.','2024-03-16','Activa'),(17,17,'Muy contento con la atención al cliente, resolvieron rápidamente un problema con mi pedido.','2024-03-17','Activa'),(18,18,'El producto llegó en perfectas condiciones y en el tiempo esperado.','2024-03-18','Activa'),(19,19,'El producto es de buena calidad, lo recomendaría a otros.','2024-03-19','Activa'),(20,20,'El envío se realizó con retraso, lo cual fue decepcionante.','2024-03-20','Activa'),(21,21,'El producto es excelente, justo lo que necesitaba.','2024-03-21','Activa'),(22,22,'No estoy satisfecho con la calidad del producto, parece ser de mala fabricación.','2024-03-22','Activa'),(23,23,'El servicio de entrega fue rápido y eficiente.','2024-03-23','Activa'),(24,24,'Buena experiencia de compra en general, volvería a comprar.','2024-03-24','Activa'),(25,25,'El producto llegó con partes faltantes, tuve que contactar al servicio al cliente para resolver el problema.','2024-03-25','Activa');
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_soccer_live'
--

--
-- Dumping routines for database 'db_soccer_live'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 11:47:14
