--SCRIPT CRUD PERMISOS

CREATE PROCEDURE CUD_Permisos
(
    @modo INT,
    @idPermiso INT,
    @permiso NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el permiso ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[permisos] WHERE permiso = @permiso)
        BEGIN
            -- Insertar un nuevo permiso
            INSERT INTO [ProximaGen].[proximagen].[permisos] (permiso)
            VALUES (@permiso);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El permiso ya existe. No se ha creado un nuevo permiso.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el permiso ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[permisos] WHERE permiso = @permiso)
        BEGIN
            -- Actualizar un permiso existente
            UPDATE [ProximaGen].[proximagen].[permisos]
            SET permiso = @permiso
            WHERE idPermiso = @idPermiso;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El permiso ya existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Permiso existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[permisos] WHERE idPermiso = @idPermiso)
        BEGIN
            -- Eliminar un permiso existente
            DELETE FROM [ProximaGen].[proximagen].[permisos]
            WHERE idPermiso = @idPermiso;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Permiso no existe. No se ha realizado la eliminaci�n.';
        END
    END
    ELSE
    BEGIN
        -- Manejar otros modos o valores de modo seg�n sea necesario
        -- Puedes agregar m�s casos o manejar errores aqu� si es necesario
        PRINT 'Modo no v�lido.';
    END

    IF @creado = 1
    BEGIN
        PRINT 'La operaci�n se ha completado con �xito.';
    END
END;


-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Permiso
EXEC CUD_Permisos 1, NULL, 'Permisos de tsi';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Permiso existente
EXEC CUD_Permisos 2, 1, 'Permiso de estudiante';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Permiso existente
EXEC CUD_Permisos 3, 5, NULL;

Select * from ProximaGen.proximagen.permisos