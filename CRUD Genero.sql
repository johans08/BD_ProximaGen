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
        -- Validar si el g�nero ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE genero = @genero)
        BEGIN
            -- Insertar un nuevo g�nero
            INSERT INTO [ProximaGen].[proximagen].[generos] (genero)
            VALUES (@genero);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El g�nero ya existe. No se ha creado un nuevo g�nero.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de g�nero existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE idGenero = @idGenero)
        BEGIN
            -- Actualizar un g�nero existente
            UPDATE [ProximaGen].[proximagen].[generos]
            SET genero = @genero
            WHERE idGenero = @idGenero;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de g�nero no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de g�nero existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[generos] WHERE idGenero = @idGenero)
        BEGIN
            -- Eliminar un g�nero existente
            DELETE FROM [ProximaGen].[proximagen].[generos]
            WHERE idGenero = @idGenero;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de g�nero no existe. No se ha realizado la eliminaci�n.';
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


-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo g�nero
EXEC CUD_Generos 1, NULL, 'Otro';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un g�nero existente
EXEC CUD_Generos 2, 1, 'Femenino';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un g�nero existente
EXEC CUD_Generos 3, 3, NULL;


Select * from ProximaGen.proximagen.generos