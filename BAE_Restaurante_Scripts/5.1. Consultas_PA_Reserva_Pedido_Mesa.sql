
--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Reserva_S_Buscar_Fecha
	@pbusqueda date
as
begin
	select r.id_reserva,r.fecha,r.hora_inicio,r.hora_fin,c.num_documento,c.nombres,c.apellidos
	from Reserva as r
	inner join Cliente as c
	on r.id_cliente=c.id_cliente
	where r.fecha=@pbusqueda
end
go

--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Reserva_S_Buscar_Fechas
	@pbusqueda1 date,
	@pbusqueda2 date
as
begin
	select r.id_reserva,r.fecha,r.hora_inicio,r.hora_fin,c.num_documento,c.nombres,c.apellidos,c.id_cliente
	from Reserva as r
	inner join Cliente as c
	on r.id_cliente=c.id_cliente
	where r.fecha>@pbusqueda1 and r.fecha<@pbusqueda2
end
go


--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Pedido_S_Buscar_A
as
begin
	select p.id_pedido,p.fecha,p.tipo_pedido,p.tipo_pago,p.imagen_pago,p.estado,p.direccion_envio,p.comentario,
	e.nombres as 'Nombre Empleado',e.apellidos as 'Apellido Empleado',
	c.num_documento as 'DNI Cliente',c.nombres as 'Nombre Cliente',c.apellidos as 'Apellido Cliente',
	m.codigo as 'Codigo mesa',c.id_cliente,e.id_empleado,m.id_mesa

	from Pedido as p
	inner join Cliente as c
	on p.id_cliente=c.id_cliente

	inner join Empleado as e
	on p.id_empleado=e.id_empleado

	inner join Mesa as m
	on p.id_mesa=m.id_mesa

	where p.estado='A'
end
go


--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Mesa_S_Buscar_True
as
begin
	select id_mesa,codigo,estado,asientos
	from Mesa
	where estado=1
end
go

--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Mesa_S_Buscar_False
as
begin
	select id_mesa,codigo,estado,asientos
	from Mesa
	where estado=0
end
go
