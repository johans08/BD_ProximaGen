CREATE PROCEDURE CUD_Roles
(
    @modo INT,
    @idRol INT,
    @descripcionRol NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el ID de Rol ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[roles] WHERE descripcionRol = @descripcionRol)
        BEGIN
            -- Insertar un nuevo Rol
            INSERT INTO [ProximaGen].[proximagen].[roles] (descripcionRol)
            VALUES (@descripcionRol);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La descripción de Rol ya existe. No se ha creado un nuevo Rol.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de Rol existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[roles] WHERE idRol = @idRol)
        BEGIN
            -- Actualizar un Rol existente
            UPDATE [ProximaGen].[proximagen].[roles]
            SET descripcionRol = @descripcionRol
            WHERE idRol = @idRol;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Rol no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Rol existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[roles] WHERE idRol = @idRol)
        BEGIN
            -- Eliminar un Rol existente
            DELETE FROM [ProximaGen].[proximagen].[roles]
            WHERE idRol = @idRol;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Rol no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Rol
EXEC CUD_Roles 1, NULL, 'TI';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Rol existente
EXEC CUD_Roles 2, 1, 'Estudiante';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Rol existente
EXEC CUD_Roles 3, 3, NULL;

Select * from ProximaGen.proximagen.roles