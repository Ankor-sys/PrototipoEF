use hotel_general;

#Creación de triggers
CREATE TRIGGER AgregarBitacora AFTER INSERT ON cliente FOR EACH ROW INSERT INTO bitacora(id_bitacora, id_usuario, descripcion, fecha, hora) VALUES ("0", current_user(), "Ingreso de cliente nuevo", current_date(), current_time());
CREATE TRIGGER AgregarBitacora1 AFTER UPDATE ON cliente FOR EACH ROW INSERT INTO bitacora(id_bitacora, id_usuario, descripcion, fecha, hora) VALUES ("0", current_user(), "Modificacion de cliente", current_date(), current_time());
select * from bitacora; 

#Creación de views
use hotel_general;
CREATE VIEW consulta_bitacora AS SELECT bitacora.id_bitacora as `ID`, bitacora.id_usuario as `Usuario`,
bitacora.descripcion as `Descripción`, bitacora.fecha as `Fecha`, bitacora.hora as `Hora` FROM bitacora;
select * from consulta_bitacora;

CREATE VIEW consulta_clientes AS SELECT id_cliente as `ID`, id_tipo_cliente as `ID Cliente`, 
nombre_cliente as `Nombre`, nit_cliente as `NIT`, correo as `Correo`, telefono as `Telefono`, direccion as `Direccion` from cliente; 
select * from consulta_clientes;


#Procedimiento Almacenado 
INSERT INTO usuarios VALUES ("sebas", "Sebastian Moreira", "12345", "11");
CALL sp_LoginUsuario('sebas','12345',@codigo, @existe);
SELECT @codigo, @existe;

