CREATE PROCEDURE CUD_Generos
(
    @modo INT,
    @idGenero INT,
    @genero NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el género ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE genero = @genero)
        BEGIN
            -- Insertar un nuevo género
            INSERT INTO [ProximaGen].[proximagen].[generos] (genero)
            VALUES (@genero);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El género ya existe. No se ha creado un nuevo género.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de género existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE idGenero = @idGenero)
        BEGIN
            -- Actualizar un género existente
            UPDATE [ProximaGen].[proximagen].[generos]
            SET genero = @genero
            WHERE idGenero = @idGenero;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de género no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de género existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE idGenero = @idGenero)
        BEGIN
            -- Eliminar un género existente
            DELETE FROM [ProximaGen].[proximagen].[generos]
            WHERE idGenero = @idGenero;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de género no existe. No se ha realizado la eliminación.';
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


-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo género
EXEC CUD_Generos 1, NULL, 'Otro';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un género existente
EXEC CUD_Generos 2, 1, 'Femenino';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un género existente
EXEC CUD_Generos 3, 3, NULL;


Select * from ProximaGen.proximagen.generos