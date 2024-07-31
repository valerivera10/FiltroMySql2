DROP DATABASE IF EXISTS MySql2;
CREATE DATABASE MySql2;
USE MySql2;





    


CREATE TABLE miscompras.categorias (
    id_categoria INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(45) NOT NULL,
    estado TINYINT NOT NULL
);

CREATE TABLE miscompras.cientes (
    id VARCHAR(20) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    celular DECIMAL(10, 0) NOT NULL,
    direccion VARCHAR(80) NOT NULL,
    correo_electronico VARCHAR(70) NOT NULL,
    column_7 BIGINT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE miscompras.productos (
    id_producto INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    id_categoria INT NOT NULL,
    codigo_barras VARCHAR(150) NOT NULL,
    precio_venta DECIMAL(16, 2) NOT NULL,
    cantidad_stock INT NOT NULL,
    estado TINYINT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES miscompras.categorias(id_categoria)
);

CREATE TABLE miscompras.compras (
    id_compra INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente VARCHAR(20) NOT NULL,
    fecha DATETIME NOT NULL,
    medio_pago CHAR(1) NOT NULL,
    comentario VARCHAR(300) NOT NULL,
    estado CHAR(1) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES miscompras.cientes(id)
);

CREATE TABLE miscompras.compras_productos (
    id_compra INT UNSIGNED NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(16, 2) NOT NULL,
    estado TINYINT NOT NULL,
    PRIMARY KEY (id_compra, id_producto),
    FOREIGN KEY (id_compra) REFERENCES miscompras.compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES miscompras.productos(id_producto)
);
