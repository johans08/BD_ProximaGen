--SCRIPT CRUD DIAS

CREATE PROCEDURE CUD_Dias
(
    @modo INT,
    @idDia INT,
    @dia NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el ID de Día ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[dias] WHERE dia = @dia)
        BEGIN
            -- Insertar un nuevo Día
            INSERT INTO [ProximaGen].[proximagen].[dias] (dia)
            VALUES (@dia);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Día ya existe. No se ha creado uno nuevo.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de Día existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[dias] WHERE idDia = @idDia)
        BEGIN
            -- Actualizar un Día existente
            UPDATE [ProximaGen].[proximagen].[dias]
            SET dia = @dia
            WHERE idDia = @idDia;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Día no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Día existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[dias] WHERE idDia = @idDia)
        BEGIN
            -- Eliminar un Día existente
            DELETE FROM [ProximaGen].[proximagen].[dias]
            WHERE idDia = @idDia;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Día no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Día
EXEC CUD_Dias 1, NULL, 'Miercoles';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Día existente
EXEC CUD_Dias 2, 1, 'Lunes';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Día existente
EXEC CUD_Dias 3, 3, NULL;

Select * from ProximaGen.proximagen.dias