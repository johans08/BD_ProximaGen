-- SCRIPT CRUD PERSONAS

CREATE PROCEDURE CUD_Personas
(
    @modo INT,
    @cedula NVARCHAR(15),
    @nombre NVARCHAR(50),
    @apellido NVARCHAR(50),
    @apellido2 NVARCHAR(50),
    @fechaNacimiento DATE,
    @Generos_idGenero INT,
    @Estados_idEstado INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si la cédula ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[ProximaGen].[personas] WHERE cedula = @cedula)
        BEGIN
            -- Insertar una nueva persona
            INSERT INTO [ProximaGen].[ProximaGen].[personas] (cedula, nombre, apellido, apellido2, fechaNacimiento, Generos_idGenero, Estados_idEstado)
            VALUES (@cedula, @nombre, @apellido, @apellido2, @fechaNacimiento, @Generos_idGenero, @Estados_idEstado);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La cédula ya existe. No se ha creado una nueva persona.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si la cédula existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[ProximaGen].[personas] WHERE cedula = @cedula)
        BEGIN
            -- Actualizar una persona existente
            UPDATE [ProximaGen].[ProximaGen].[personas]
            SET nombre = @nombre, apellido = @apellido, apellido2 = @apellido2, fechaNacimiento = @fechaNacimiento, Generos_idGenero = @Generos_idGenero, Estados_idEstado = @Estados_idEstado
            WHERE cedula = @cedula;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La cédula no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si la cédula existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[ProximaGen].[personas] WHERE cedula = @cedula)
        BEGIN
            -- Eliminar una persona existente
            DELETE FROM [ProximaGen].[ProximaGen].[personas]
            WHERE cedula = @cedula;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La cédula no existe. No se ha realizado la eliminación.';
        END
    END
    ELSE
    BEGIN
        -- Manejar otros modos o valores de modo según sea necesario
        -- Puedes agregar más casos o manejar errores aquí si es necesario
        PRINT 'Modo no válido.';
    END

    IF @creado = 1
    BEGIN
        PRINT 'La operación se ha completado con éxito.';
    END
END;



EXEC CUD_Personas
	@modo = 3,
    @cedula = '34234242',
    @nombre = 'Johans',
    @apellido = 'TEST VDS',
    @apellido2 = 'Test',
    @fechaNacimiento = '1990-01-15',
    @Generos_idGenero = 1,
    @Estados_idEstado = 1;

	select * from ProximaGen.proximagen.personas