CREATE DATABASE IF NOT EXISTS ejercicio_queries;
USE ejercicio_queries;
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(20)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    fecha_pedido DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


INSERT INTO clientes (id, nombre, direccion, telefono) VALUES
    (1, 'Juan Perez', 'Calle 123, Ciudad', '1234567890'),
    (2, 'Maria Gomez', 'Avenida 456, Ciudad', '9876543210'),
    (3, 'Pedro Rodriguez', 'Calle 789, Ciudad', '5555555555'),
    (4, 'Ana Lopez', 'Avenida 321, Ciudad', '1111111111'),
    (5, 'Luis Hernandez', 'Calle 654, Ciudad', '9999999999'),
    (6, 'Carla Martinez', 'Avenida 987, Ciudad', '7777777777'),
    (7, 'Miguel Garcia', 'Calle 321, Ciudad', '8888888888');

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

--- Proyecta todos los clientes de tabla clientes y sus pedidos ---
SELECT clientes.id, clientes.nombre, clientes.direccion, clientes.telefono, pedidos.id, pedidos.cliente_id, pedidos.fecha_pedido, pedidos.total
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

--- Proyecta todos los pedidos realizados por un cliente especifico, utilizando su ID ---
SELECT pedidos.id AS pedidos_id,
       pedidos.cliente_id,
       pedidos.fecha_pedido,
       pedidos.total
FROM pedidos
WHERE pedidos.cliente_id = 2
ORDER BY pedidos.fecha_pedido;

--- Calcula el total de todos los pedidos para cada cliente ---
SELECT clientes.id, clientes.nombre, clientes.direccion, clientes.telefono, SUM(pedidos.total) AS total_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id, clientes.nombre, clientes.direccion, clientes.telefono;

--- Actualiza la dirección de un cliente dado su id ---
UPDATE clientes
SET direccion = 'Calle siempreviva 123'
WHERE id = 2;

--- Elimina un cliente especifico de "clientes" y todos sus pedidos asociados de "pedidos" ---
DELETE FROM pedidos WHERE cliente_id = 5;
DELETE FROM clientes WHERE id = 5;

--- Proyecta los tres clientes que han realizado más pedidos, ordenados de forma descendente por el número de pedidos ---   
SELECT c.id AS cliente_id, c.nombre, COUNT(p.id) AS num_pedidos
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre
ORDER BY num_pedidos DESC
LIMIT 3;
