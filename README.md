# bases_de_datos_final


## Ejemplo: Gestión de un Cine
Diseña un modelo de base de datos para un sistema de gestión de un cine con solo cinco entidades principales.

Películas: Cada película tiene un código único, título, género, duración (en minutos) y clasificación por edad (por ejemplo, "PG-13").

Salas: Cada sala del cine tiene un código único, capacidad máxima, tipo de sala (2D, 3D, IMAX) y un nombre descriptivo (por ejemplo, "Sala 1" o "Sala Premium").

Funciones: Una función representa una proyección de una película en una sala a una hora específica. Se debe registrar el código de la función, la sala, la película, la fecha y hora, y el precio del boleto.

Clientes: De cada cliente se guarda un código único, nombre completo, correo electrónico y, opcionalmente, su número de teléfono.

Boletos: Cada boleto tiene un número único, está asociado a una función y a un cliente (si es una compra en línea), e incluye información como la fecha de compra, el número de asiento y el precio pagado.

