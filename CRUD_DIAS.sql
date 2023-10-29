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
        -- Validar si el ID de D�a ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[dias] WHERE dia = @dia)
        BEGIN
            -- Insertar un nuevo D�a
            INSERT INTO [ProximaGen].[proximagen].[dias] (dia)
            VALUES (@dia);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El D�a ya existe. No se ha creado uno nuevo.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de D�a existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[dias] WHERE idDia = @idDia)
        BEGIN
            -- Actualizar un D�a existente
            UPDATE [ProximaGen].[proximagen].[dias]
            SET dia = @dia
            WHERE idDia = @idDia;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de D�a no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de D�a existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[dias] WHERE idDia = @idDia)
        BEGIN
            -- Eliminar un D�a existente
            DELETE FROM [ProximaGen].[proximagen].[dias]
            WHERE idDia = @idDia;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de D�a no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo D�a
EXEC CUD_Dias 1, NULL, 'Miercoles';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un D�a existente
EXEC CUD_Dias 2, 1, 'Lunes';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un D�a existente
EXEC CUD_Dias 3, 3, NULL;

Select * from ProximaGen.proximagen.dias