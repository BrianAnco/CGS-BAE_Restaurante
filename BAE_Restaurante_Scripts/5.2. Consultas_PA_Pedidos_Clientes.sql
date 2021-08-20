
--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Pedido_Comida_S_Mas_vendido
as
begin
	select top(5) with ties c.nombre, sum(pc.cantidad)[Ventas]
	from Pedido_Comida as pc
		inner join Comida as c
		on pc.id_comida=c.id_comida
	group by c.nombre
	order by Ventas desc;
end

--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Pedido_Producto_S_Mas_vendido
as
begin
	select top(5) with ties p.nombre, sum(pp.cantidad)[Ventas]
	from Pedido_Producto as pp
		inner join Producto as p
		on pp.id_producto=p.id_producto
	group by p.nombre
	order by Ventas desc;
end

--Procedimiento almacenado de ventas po categorias
CREATE PROCEDURE usp_Tipo_comida_Ventas
as
begin
	select tc.nombre as 'Nombre', sum(c.precio*pc.cantidad) as 'Venta total'
	from Tipo_comida as tc
	inner join Comida as c
		on tc.id_tipo_comida=c.id_tipo_comida
	inner join Pedido_comida as pc
		on pc.id_comida=c.id_comida
	group by tc.nombre
end


--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Pedido_S_Buscar_Fechas
	@pbusqueda1 date,
	@pbusqueda2 date
as
begin
	select p.fecha as 'Fecha',p.tipo_pedido as 'Tipo del pedido',p.tipo_pago as 'Tipo de pago',p.estado as 'Estado',p.direccion_envio as 'Dirección del envío',p.comentario as 'Comentario',
	e.nombres as 'Nombre del empleado',e.apellidos as 'Apellido del empleado',
	c.num_documento as 'DNI Cliente',c.nombres as 'Nombre del cliente',c.apellidos as 'Apellido del cliente',
	m.codigo as 'Codigo mesa'

	from Pedido as p
	inner join Cliente as c
	on p.id_cliente=c.id_cliente

	inner join Empleado as e
	on p.id_empleado=e.id_empleado

	inner join Mesa as m
	on p.id_mesa=m.id_mesa

	where p.fecha>@pbusqueda1 and p.fecha <@pbusqueda2
end
go

--Procedimiento almacenado de Buscar
CREATE PROCEDURE usp_Cliente_S_Buscar_Mejores
as
begin
	select c.num_documento as 'DNI Cliente',
	 sum(dv.venta_total)[Compra total]
	from Doc_venta as dv
	
	inner join Pedido as p
	on dv.id_pedido=p.id_pedido

	inner join Cliente as c
	on p.id_cliente=c.id_cliente

	group by c.num_documento
	order by [Compra total] desc;
end