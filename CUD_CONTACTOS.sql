-- Script CRUD para Contactos
CREATE PROCEDURE CUD_Contactos
(
    @modo INT,
    @idContacto INT,
    @descripcionContacto VARCHAR(255),
    @TipoContactos_idTipoContacto INT,
    @Personas_idPersona INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1 -- Modo de inserción
    BEGIN
        -- Validar si el Contacto ya existe
        IF NOT EXISTS (SELECT 1 FROM [proximagen].[proximagen].[contacto] WHERE descripcionContacto = @descripcionContacto AND TipoContactos_idTipoContacto = @TipoContactos_idTipoContacto AND Personas_idPersona = @Personas_idPersona)
        BEGIN
            -- Insertar un nuevo Contacto
            INSERT INTO [proximagen].[proximagen].[contacto] (descripcionContacto, TipoContactos_idTipoContacto, Personas_idPersona)
            VALUES (@descripcionContacto, @TipoContactos_idTipoContacto, @Personas_idPersona);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Contacto ya existe. No se ha creado un nuevo Contacto.';
        END
    END
    ELSE IF @modo = 2 -- Modo de actualización
    BEGIN
        -- Validar si el ID de Contacto existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[contacto] WHERE idContacto = @idContacto)
        BEGIN
            -- Actualizar un Contacto existente
            UPDATE [proximagen].[proximagen].[contacto]
            SET descripcionContacto = @descripcionContacto, TipoContactos_idTipoContacto = @TipoContactos_idTipoContacto, Personas_idPersona = @Personas_idPersona
            WHERE idContacto = @idContacto;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Contacto no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3 -- Modo de eliminación
    BEGIN
        -- Validar si el ID de Contacto existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[contacto] WHERE idContacto = @idContacto)
        BEGIN
            -- Eliminar un Contacto existente
            DELETE FROM [proximagen].[proximagen].[contacto]
            WHERE idContacto = @idContacto;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Contacto no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Contacto
EXEC CUD_Contactos 1, NULL, 'Contacto de ejemplo', 1, 2;

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Contacto existente
EXEC CUD_Contactos 2, 1, 'Contacto actualizado', 2, 2;

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Contacto existente
EXEC CUD_Contactos 3, 3, NULL, NULL, NULL;

-- Ejemplo de consulta SELECT para obtener datos de Contactos
SELECT [idContacto]
      ,[descripcionContacto]
      ,[TipoContactos_idTipoContacto]
      ,[Personas_idPersona]
  FROM [proximagen].[proximagen].[contacto];


