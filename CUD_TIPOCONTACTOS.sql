CREATE PROCEDURE CUD_Tipo_Contactos
(
   @modo INT, 
   @idTipoContacto INT, 
   @descripcionTipoContacto VARCHAR(45)
)

AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si la descripción del estado ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE descripcionTipoContacto = @descripcionTipoContacto)
        BEGIN
            -- Insertar un nuevo estado
            INSERT INTO [ProximaGen].[proximagen].[tipocontactos] (descripcionTipoContacto)
            VALUES (@descripcionTipoContacto);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La descripción del estado ya existe. No se ha creado un nuevo estado.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si la descripción del estado ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE descripcionTipoContacto = @descripcionTipoContacto)
        BEGIN
            -- Actualizar un estado existente
            UPDATE [ProximaGen].[proximagen].[tipocontactos]
            SET descripcionTipoContacto = @descripcionTipoContacto
            WHERE idTipoContacto = @idTipoContacto;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La descripción del estado ya existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Estado existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE idTipoContacto = @idTipoContacto)
        BEGIN
            -- Eliminar un estado existente
            DELETE FROM [ProximaGen].[proximagen].[tipocontactos]
            WHERE idTipoContacto = @idTipoContacto;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Estado no existe. No se ha realizado la eliminación.';
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


-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo estado
EXEC CUD_Tipo_Contactos 1, null, 'Esperando 1';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un estado existente
EXEC CUD_Tipo_Contactos 2, 4, 'Esperando';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un estado existente
EXEC CUD_Tipo_Contactos 3, 3, NULL;


Select * from ProximaGen.proximagen.tipocontactos