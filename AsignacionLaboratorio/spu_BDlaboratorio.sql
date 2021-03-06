
use BDOrganizacionLaboratoriosDAI
--======================================================================================
--================================== TDocente ===========================================
--======================================================================================
-- insertar
if exists (select * from dbo.sysobjects where name = 'spuTDocente_Insertar')
	drop procedure spuTDocente_Insertar
go
create procedure spuTDocente_Insertar
	@CodDocente varchar (5),
	@Nombre varchar(100)
as
begin
	if (@CodDocente!= '' and not exists (select * from TDocente where CodDocente = @CodDocente))
	begin
		if(@Nombre!='')
		begin
			insert into TDocente values(@CodDocente,@Nombre)
			select CodError = 0, Mensaje = 'Registro insertado exitosamente'
		end
		else
			select CodError = 1, Mensaje='El campo nombre no debe estar en blanco'
	end
	else
		select CodError = 1, Mensaje = 'El c�digo se encuentra en blanco o est� duplicado'
end
go



--=======================================================================================
-- SPU Actualizar 
if exists (select * from dbo.sysobjects where name = 'spuTDocente_Actualizar')
	drop procedure spuTDocente_Actualizar
go
create procedure spuTDocente_Actualizar
	@CodDocente varchar (5),
	@Nombre varchar (100)
as
begin
	if (@CodDocente != '' and exists (select * from TDocente where CodDocente = @CodDocente))
	begin
		if (@Nombre != '')
		begin
			update TDocente set 
				Nombre = @Nombre
				where CodDocente = @CodDocente
			select CodError = 0, Mensaje = 'Registro actualizado exitosamente'
		end
	end
	else
		select CodError = 1, Mensaje = 'El c�digo no existe en la base de datos'
end
go
--=======================================================================================
-- SPU Listar Docente
if exists (select * from dbo.sysobjects where name = 'spuTDocente_Listar')
	drop procedure spuTDocente_Listar
go
create procedure spuTDocente_Listar
as
begin
	select* from TDocente
end
go

--======================================================================================
--================================== TAsignatura ===========================================
--======================================================================================
--INSERTAR
if exists(select* from dbo.sysobjects where name='spuTAsignatura_Insertar')
	drop procedure spuTAsignatura_Insertar
go
create procedure spuTAsignatura_Insertar
	@CodAsignatura varchar(12),
	@NombreAsignatura varchar(40),
	@Creditos varchar(20),
	@Categoria varchar(20),
	@CodDocente varchar(8)

	--insert into TAsignatura values(@CodAsignatura,@NombreAsignatura,@Creditos,@Categoria,@CodDocente)
	--				select CodError = 0, Mensaje = 'Registro insertado exitosamente'

as
begin
if (@CodAsignatura != '' and exists (select * from TAsignatura where CodAsignatura = @CodAsignatura))
begin
	if(@NombreAsignatura!='')
	begin
		if(@Creditos!='')
		begin
			if(@Categoria!='')
			begin
				if(@CodDocente!='')
				begin
					insert into TAsignatura values(@CodAsignatura,@NombreAsignatura,@Creditos,@Categoria,@CodDocente)
					select CodError = 0, Mensaje = 'Registro insertado exitosamente'
				end
			end
			else
				select CodError = 1, Mensaje = 'la categoria no debe estar vacia'
		end
		else
			select CodError = 1, Mensaje = 'Los creditos no debe estar vacio'
	end
	else
		select CodError = 1, Mensaje='El nombre de la asignatura no debe estar vacio'
end
else
	select CodError = 1, Mensaje='El codigo de la asignatura no debe estar vacio'
end
go

--ACTUALIZAR
if exists(select* from dbo.sysobjects where name='spuTAsignatura_Actualizar')
	drop procedure spuTAsignatura_Actualizar
go
create procedure spuTAsignatura_Actualizar
	@CodAsignatura varchar(12),
	@NombreAsignatura varchar(40),
	@Creditos varchar(20),
	@Categoria varchar(20),
	@CodDocente varchar(8)
as
begin
if (@CodAsignatura != '' and exists (select * from TAsignatura where CodAsignatura = @CodAsignatura))
begin
	if(@NombreAsignatura!='')
	begin
		if(@Creditos!='')
		begin
			if(@Categoria!='')
			begin
				if(@CodDocente!='')
				begin
					update TAsignatura set
					CodAsignatura = @CodAsignatura,
					NombreAsignatura = @NombreAsignatura,
					Creditos = @Creditos,
					Categoria = @Categoria,
					CodDocente = @CodDocente
					where CodAsignatura=@CodAsignatura
					select CodError = 0, Mensaje = 'Registro actualizado exitosamente'
				end
				
			end
			else
				select CodError = 1, Mensaje = 'la categoria no debe estar vacia'
		end
		else
			select CodError = 1, Mensaje = 'Los creditos no debe estar vacio'
	end
	else
		select CodError = 1, Mensaje='El nombre de la asignatura no debe estar vacio'
end
else
	select CodError = 1, Mensaje='El codigo de la asignatura no existe'
end
go

------------------------------------------------------------------------
-----------------------------------TUsuario-----------------------------
------------------------------------------------------------------------

if exists (select * from dbo.sysobjects where name = 'spuTUsuario_Insertar')
	drop procedure spuTUsuario_Insertar
go
create procedure spuTUsuario_Insertar
	@Contrase�a varchar(10),
	@Nombre varchar (50),
	@Apellido_Paterno varchar(50),
	@Apellido_Materno varchar (50),
	@Dni_Usuario varchar(8),
	@Estado varchar(10)
as
begin
if(@Dni_Usuario!='' and not exists(select* from TUsuario where Dni_Usuario=@Dni_Usuario))
begin
	if(@Nombre!='')
	begin
		if(@Apellido_Paterno!='')
		begin
			if(@Apellido_Materno!='')
			begin
				insert into TUsuario values(@Contrase�a, @Nombre, @Apellido_Paterno, @Apellido_Materno, @Dni_Usuario,@Estado)
				select CodError = 0
			end
		end
		else
			select CodError = 1
	end
	else
		select CodError = 1
end
else
	select CodError = 1
end
go

--actualizarUsuario
if exists (select* from dbo.sysobjects where name='spuTUsuario_Actualizar')
	drop procedure spuTUsuario_Actualizar
go
create procedure spuTUsuario_Actualizar
	@Contrase�a varchar(10),
	@Nombre varchar (50),
	@Apellido_Paterno varchar(50),
	@Apellido_Materno varchar (50),
	@Dni_Usuario varchar(8),
	@Estado varchar(10)
as
begin
if(@Dni_Usuario!='' and exists(select* from TUsuario where Dni_Usuario=@Dni_Usuario))
begin
	if(@Nombre!='')
	begin
		if(@Apellido_Paterno!='')
		begin
			if(@Apellido_Materno!='')
			begin
				update TUsuario set
				Nombre=@Nombre,
				Apellido_Paterno=@Apellido_Paterno,
				Apellido_Materno=@Apellido_Materno,
				Estado=@Estado
				where Dni_Usuario=@Dni_Usuario
				select CodError = 0
			end
		end
		else
			select CodError = 1
	end
	else
		select CodError = 1
end
else
	select CodError = 1
end
go



