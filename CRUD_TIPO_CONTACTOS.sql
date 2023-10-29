-- SCRIPT CRUD TIPO CONTACTOS
CREATE PROCEDURE CUD_TipoContacto
(
    @modo INT,
    @idTipoContacto INT,
    @descripcionTipoContacto NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el Tipo de Contacto ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE descripcionTipoContacto = @descripcionTipoContacto)
        BEGIN
            -- Insertar un nuevo Tipo de Contacto
            INSERT INTO [ProximaGen].[proximagen].[tipocontactos] (descripcionTipoContacto)
            VALUES (@descripcionTipoContacto);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Tipo de Contacto ya existe. No se ha creado uno nuevo.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de Tipo de Contacto existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE idTipoContacto = @idTipoContacto)
        BEGIN
            -- Actualizar un Tipo de Contacto existente
            UPDATE [ProximaGen].[proximagen].[tipocontactos]
            SET descripcionTipoContacto = @descripcionTipoContacto
            WHERE idTipoContacto = @idTipoContacto;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Tipo de Contacto no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Tipo de Contacto existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE idTipoContacto = @idTipoContacto)
        BEGIN
            -- Eliminar un Tipo de Contacto existente
            DELETE FROM [ProximaGen].[proximagen].[tipocontactos]
            WHERE idTipoContacto = @idTipoContacto;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Tipo de Contacto no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Tipo de Contacto
EXEC CUD_TipoContacto 1, Null, 'Correo';
EXEC CUD_TipoContacto 1, NULL, 'Celular';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Tipo de Contacto existente
EXEC CUD_TipoContacto 2, 1, 'Celular';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Tipo de Contacto existente
EXEC CUD_TipoContacto 3, 3, NULL;

Select * from ProximaGen.proximagen.tipocontactos