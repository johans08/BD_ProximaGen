--SCRIPT CRUD DESCUENTO

CREATE PROCEDURE CUD_Descuento
(
    @modo INT,
    @idDescuento INT,
    @porcentaje DECIMAL(5, 2),
    @TipoDescuento_idTipoDescuento INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el Descuento ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[descuentos] WHERE porcentaje = @porcentaje)
        BEGIN
            -- Insertar un nuevo Descuento
            INSERT INTO [ProximaGen].[proximagen].[descuentos] (porcentaje, TipoDescuento_idTipoDescuento)
            VALUES (@porcentaje, @TipoDescuento_idTipoDescuento);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Descuento ya existe. No se ha creado uno nuevo.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de Descuento existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[descuentos] WHERE idDescuento = @idDescuento)
        BEGIN
            -- Actualizar un Descuento existente
            UPDATE [ProximaGen].[proximagen].[descuentos]
            SET porcentaje = @porcentaje, TipoDescuento_idTipoDescuento = @TipoDescuento_idTipoDescuento
            WHERE idDescuento = @idDescuento;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Descuento no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Descuento existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[descuentos] WHERE idDescuento = @idDescuento)
        BEGIN
            -- Eliminar un Descuento existente
            DELETE FROM [ProximaGen].[proximagen].[descuentos]
            WHERE idDescuento = @idDescuento;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Descuento no existe. No se ha realizado la eliminación.';
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


EXEC CUD_Descuento
	@modo = 1,
    @idDescuento = 1,
    @porcentaje = 10.00,
    @TipoDescuento_idTipoDescuento = 1;

Select * from ProximaGen.proximagen.descuentos