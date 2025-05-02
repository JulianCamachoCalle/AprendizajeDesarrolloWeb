
-- -----------------------------------------------------
-- Table `CATEGORIAS`
-- -----------------------------------------------------
CREATE TABLE CATEGORIAS (
  id_categoria INT AUTO_INCREMENT NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  estado BOOLEAN NOT NULL,
  PRIMARY KEY (id_categoria)
);

-- -----------------------------------------------------
-- Table `PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE PRODUCTOS (
  id_producto INT AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(45),
  id_categoria INT NOT NULL,
  codigo_barras VARCHAR(150),
  precio_venta DECIMAL(16,2),
  cantidad_stock INT NOT NULL,
  estado BOOLEAN,
  PRIMARY KEY (id_producto),
  CONSTRAINT fk_PRODUCTOS_CATEGORIAS
    FOREIGN KEY (id_categoria)
    REFERENCES CATEGORIAS (id_categoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `CLIENTES`
-- -----------------------------------------------------
CREATE TABLE CLIENTES (
  id VARCHAR(20) NOT NULL,
  nombre VARCHAR(40),
  apellidos VARCHAR(100),
  celular BIGINT,
  direccion VARCHAR(80),
  correo_electronico VARCHAR(70),
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table `COMPRAS`
-- -----------------------------------------------------
CREATE TABLE COMPRAS (
  id_compra INT AUTO_INCREMENT NOT NULL,
  id_cliente VARCHAR(20) NOT NULL,
  fecha DATETIME,
  medio_pago CHAR(1),
  comentario VARCHAR(300),
  estado CHAR(1),
  PRIMARY KEY (id_compra),
  CONSTRAINT fk_COMPRAS_CLIENTES1
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTES (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `COMPRAS_PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE COMPRAS_PRODUCTOS (
  id_compra INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT,
  total DECIMAL(16,2),
  estado BOOLEAN,
  PRIMARY KEY (id_compra, id_producto),
  CONSTRAINT fk_COMPRAS_PRODUCTOS_PRODUCTOS1
    FOREIGN KEY (id_producto)
    REFERENCES PRODUCTOS (id_producto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_COMPRAS_PRODUCTOS_COMPRAS1
    FOREIGN KEY (id_compra)
    REFERENCES COMPRAS (id_compra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
