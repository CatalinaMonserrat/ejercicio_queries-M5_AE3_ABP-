Ejercicio: Consultas SQL sobre Clientes y Pedidos

Este proyecto consiste en la creación y manipulación de una base de datos relacional simple para practicar queries SQL.
Se trabaja con dos tablas: clientes y pedidos, relacionadas mediante una clave foránea.

📌 Objetivos

Practicar la creación de bases de datos y tablas en MySQL.
Insertar datos de prueba en las tablas.
Ejecutar consultas para proyectar, actualizar, eliminar y agrupar información.
Comprender el uso de JOIN, GROUP BY, ORDER BY y DELETE con relaciones.

🗂️ Modelo Entidad-Relación
+-------------------+         +-------------------+
|      clientes     |         |      pedidos      |
+-------------------+         +-------------------+
| id (PK)           |◄───────┤ cliente_id (FK)   |
| nombre            |         | id (PK)           |
| direccion         |         | fecha_pedido      |
| telefono          |         | total             |
+-------------------+         +-------------------+

🛠️ Estructura de la Base de Datos
CREATE DATABASE IF NOT EXISTS ejercicio_queries;
USE ejercicio_queries;

CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(20)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    fecha_pedido DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

👥 Datos de prueba
Clientes
INSERT INTO clientes (id, nombre, direccion, telefono) VALUES
    (1, 'Juan Perez', 'Calle 123, Ciudad', '1234567890'),
    (2, 'Maria Gomez', 'Avenida 456, Ciudad', '9876543210'),
    (3, 'Pedro Rodriguez', 'Calle 789, Ciudad', '5555555555'),
    (4, 'Ana Lopez', 'Avenida 321, Ciudad', '1111111111'),
    (5, 'Luis Hernandez', 'Calle 654, Ciudad', '9999999999'),
    (6, 'Carla Martinez', 'Avenida 987, Ciudad', '7777777777'),
    (7, 'Miguel Garcia', 'Calle 321, Ciudad', '8888888888');

Pedidos
INSERT INTO pedidos (id, cliente_id, fecha_pedido, total) VALUES
    (1, 1, '2025-01-01', 100.00),
    (2, 2, '2025-01-02', 150.00),
    (3, 3, '2025-01-03', 200.00),
    (4, 4, '2025-01-04', 50.00),
    (5, 5, '2025-01-05', 75.00),
    (6, 6, '2025-01-06', 125.00),
    (7, 7, '2025-01-07', 175.00),
    (8, 1, '2025-01-08', 225.00),
    (9, 2, '2025-01-09', 275.00),
    (10, 3, '2025-01-10', 325.00);

📊 Consultas realizadas
1️⃣ Proyecta todos los clientes y sus pedidos
2️⃣ Proyecta todos los pedidos de un cliente específico (ID=2)
3️⃣ Calcula el total de pedidos por cliente
4️⃣ Actualiza la dirección de un cliente
5️⃣ Elimina un cliente y sus pedidos asociados
6️⃣ Muestra los tres clientes con más pedidos

🚀 Ejecución
Copiar el contenido del archivo .sql en tu editor o cliente MySQL (Workbench, consola, VSCode, etc.).
Ejecutar primero la creación de base y tablas.
Insertar los registros de prueba.
Probar cada consulta de la sección Consultas realizadas.

✍️ Autora: Catalina Villegas Ortega - Ejercicio práctico de queries SQL