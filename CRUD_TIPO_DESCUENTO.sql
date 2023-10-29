--SCRIPT CRUD TIPO DESCUENTO

CREATE PROCEDURE CUD_TipoDescuento
(
    @modo INT,
    @idTipoDescuento INT,
    @tipoDescuento NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el Tipo de Descuento ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipodescuento] WHERE tipoDescuento = @tipoDescuento)
        BEGIN
            -- Insertar un nuevo Tipo de Descuento
            INSERT INTO [ProximaGen].[proximagen].[tipodescuento] (tipoDescuento)
            VALUES (@tipoDescuento);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Tipo de Descuento ya existe. No se ha creado uno nuevo.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de Tipo de Descuento existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipodescuento] WHERE idTipoDescuento = @idTipoDescuento)
        BEGIN
            -- Actualizar un Tipo de Descuento existente
            UPDATE [ProximaGen].[proximagen].[tipodescuento]
            SET tipoDescuento = @tipoDescuento
            WHERE idTipoDescuento = @idTipoDescuento;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Tipo de Descuento no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Tipo de Descuento existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipodescuento] WHERE idTipoDescuento = @idTipoDescuento)
        BEGIN
            -- Eliminar un Tipo de Descuento existente
            DELETE FROM [ProximaGen].[proximagen].[tipodescuento]
            WHERE idTipoDescuento = @idTipoDescuento;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Tipo de Descuento no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Tipo de Descuento
EXEC CUD_TipoDescuento 1, NULL, 'Descuento 25%';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Tipo de Descuento existente
EXEC CUD_TipoDescuento 2, 1, 'Descuento 15%';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Tipo de Descuento existente
EXEC CUD_TipoDescuento 3, 3, NULL;

Select * from ProximaGen.proximagen.tipodescuento