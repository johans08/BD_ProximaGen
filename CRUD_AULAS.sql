--SCRIPT CRUD AULAS
CREATE PROCEDURE CUD_Aulas
(
    @modo INT,
    @idAula INT,
    @direccionAula NVARCHAR(100)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el ID de Aula ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[aulas] WHERE direccionAula = @direccionAula)
        BEGIN
            -- Insertar una nueva Aula
            INSERT INTO [ProximaGen].[proximagen].[aulas] (direccionAula)
            VALUES (@direccionAula);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La dirección del Aula ya existe. No se ha creado una nueva Aula.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de Aula existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[aulas] WHERE idAula = @idAula)
        BEGIN
            -- Actualizar un Aula existente
            UPDATE [ProximaGen].[proximagen].[aulas]
            SET direccionAula = @direccionAula
            WHERE idAula = @idAula;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Aula no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Aula existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[aulas] WHERE idAula = @idAula)
        BEGIN
            -- Eliminar un Aula existente
            DELETE FROM [ProximaGen].[proximagen].[aulas]
            WHERE idAula = @idAula;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Aula no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar una nueva Aula
EXEC CUD_Aulas 1, NULL, 'Primer piso';
EXEC CUD_Aulas 1, NULL, 'Segundo piso';
EXEC CUD_Aulas 1, NULL, 'Tercer piso';

-- Ejemplo de llamada al procedimiento almacenado para actualizar una Aula existente
EXEC CUD_Aulas 2, 1, 'Segundo Piso';

-- Ejemplo de llamada al procedimiento almacenado para eliminar una Aula existente
EXEC CUD_Aulas 3, 3, NULL;

Select * from ProximaGen.proximagen.aulas