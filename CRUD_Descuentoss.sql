--SCRIPT CRUD DESCUENTOS

ALTER PROCEDURE CUD_Descuentos
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
        -- Validar si el tipo de descuento ya existe
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipodescuento] WHERE idTipoDescuento = @TipoDescuento_idTipoDescuento)
        BEGIN
            -- Validar si no existe un descuento con el mismo tipo
            IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[descuentos] WHERE TipoDescuento_idTipoDescuento = @TipoDescuento_idTipoDescuento)
            BEGIN
                -- Insertar un nuevo descuento
                INSERT INTO [ProximaGen].[proximagen].[descuentos] (porcentaje, TipoDescuento_idTipoDescuento)
                VALUES (@porcentaje, @TipoDescuento_idTipoDescuento);
                SET @creado = 1;
            END
            ELSE
            BEGIN
                PRINT 'Ya existe un descuento con el mismo tipo. No se ha creado un nuevo descuento.';
            END
        END
        ELSE
        BEGIN
            PRINT 'El tipo de descuento no existe. No se ha creado un nuevo descuento.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el tipo de descuento ya existe
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipodescuento] WHERE idTipoDescuento = @TipoDescuento_idTipoDescuento)
        BEGIN
            -- Validar si el ID de Descuento existe antes de actualizar
            IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[descuentos] WHERE idDescuento = @idDescuento)
            BEGIN
                -- Actualizar un descuento existente
                UPDATE [ProximaGen].[proximagen].[descuentos]
                SET porcentaje = @porcentaje
                WHERE idDescuento = @idDescuento;
                SET @creado = 1;
            END
            ELSE
            BEGIN
                PRINT 'El ID de Descuento no existe. No se ha realizado la actualización.';
            END
        END
        ELSE
        BEGIN
            PRINT 'El tipo de descuento no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Descuento existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[descuentos] WHERE idDescuento = @idDescuento)
        BEGIN
            -- Eliminar un descuento existente
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


-- Modo 1: Inserción de un nuevo descuento
EXEC CUD_Descuentos 1, NULL, 30, 3; -- Insertar un descuento del 15% con el tipo de descuento 1

-- Modo 2: Actualización de un descuento existente
EXEC CUD_Descuentos 2, 3, 15, 4; -- Actualizar el descuento con ID 3 al 25% con el tipo de descuento 2

-- Modo 3: Eliminación de un descuento existente
EXEC CUD_Descuentos 3, 3, NULL, NULL; -- Eliminar el descuento con ID 3

Select * from ProximaGen.proximagen.descuentos
