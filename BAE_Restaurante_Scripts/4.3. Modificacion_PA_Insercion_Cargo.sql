USE [BAE_Restaurante]
GO
/****** Object:  StoredProcedure [dbo].[usp_Cargo_U]    Script Date: 30/12/2020 3:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Procedimiento almacenado de actualizar
ALTER PROCEDURE [dbo].[usp_Cargo_U]
	@pid_cargo int,
	@pnombre varchar(45),
	@psueldo int
as
begin
	begin tran
		begin try
			update Cargo 
				set
					nombre=@pnombre,
					sueldo=@psueldo
			Where id_cargo=@pid_cargo
	commit
		end try
		begin catch
			rollback
		end catch
	end

	USE [BAE_Restaurante]
GO
/****** Object:  StoredProcedure [dbo].[usp_Cargo_D]    Script Date: 30/12/2020 3:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Procedimiento almacenado de Eliminar
ALTER PROCEDURE [dbo].[usp_Cargo_D]
	@pid_cargo int
as
begin
	begin tran
		begin try
			DELETE Cargo 
			Where id_cargo=@pid_cargo
	commit
		end try
		begin catch
			rollback
		end catch
	end
