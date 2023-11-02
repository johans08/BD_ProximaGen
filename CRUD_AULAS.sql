USE ProximaGen
--SCRIPT CRUD AULAS

CREATE PROCEDURE CUD_Aulas
(
    @modo INT,
    @idAula INT,
    @direccionAula NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si la direcci�n del aula ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[aulas] WHERE direccionAula = @direccionAula)
        BEGIN
            -- Insertar una nueva aula
            INSERT INTO [ProximaGen].[proximagen].[aulas] (direccionAula)
            VALUES (@direccionAula);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La direcci�n del aula ya existe. No se ha creado una nueva aula.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si la direcci�n del aula ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[aulas] WHERE direccionAula = @direccionAula)
        BEGIN
            -- Actualizar un aula existente
            UPDATE [ProximaGen].[proximagen].[aulas]
            SET direccionAula = @direccionAula
            WHERE idAula = @idAula;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La direcci�n del aula ya existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Aula existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[aulas] WHERE idAula = @idAula)
        BEGIN
            -- Eliminar un aula existente
            DELETE FROM [ProximaGen].[proximagen].[aulas]
            WHERE idAula = @idAula;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Aula no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar una nueva Aula
EXEC CUD_Aulas 1, NULL, 'Aula 02 primer piso';

-- Ejemplo de llamada al procedimiento almacenado para actualizar una Aula existente
EXEC CUD_Aulas 2, 1, 'Aula 01 primer piso';

-- Ejemplo de llamada al procedimiento almacenado para eliminar una Aula existente
EXEC CUD_Aulas 3, 3, NULL;

Select * from ProximaGen.proximagen.aulas