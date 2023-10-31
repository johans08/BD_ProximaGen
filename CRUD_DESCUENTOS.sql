--SCRIPT CRUD DESCUENTOS

CREATE PROCEDURE CUD_Descuentos
(
    @modo INT,
    @idDescuento INT,
    @porcentaje INT,
    @TipoDescuento_idTipoDescuento INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el porcentaje de descuento ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[descuentos] WHERE porcentaje = @porcentaje)
        BEGIN
            -- Insertar un nuevo descuento
            INSERT INTO [ProximaGen].[proximagen].[descuentos] (porcentaje, TipoDescuento_idTipoDescuento)
            VALUES (@porcentaje, @TipoDescuento_idTipoDescuento);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El porcentaje de descuento ya existe. No se ha creado un nuevo descuento.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el porcentaje de descuento ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[descuentos] WHERE porcentaje = @porcentaje)
        BEGIN
            -- Actualizar un descuento existente
            UPDATE [ProximaGen].[proximagen].[descuentos]
            SET porcentaje = @porcentaje, TipoDescuento_idTipoDescuento = @TipoDescuento_idTipoDescuento
            WHERE idDescuento = @idDescuento;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El porcentaje de descuento ya existe. No se ha realizado la actualización.';
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
EXEC CUD_Descuentos 1, NULL, 15, 1; -- Insertar un descuento del 10% con el tipo de descuento 1

-- Modo 2: Actualización de un descuento existente
EXEC CUD_Descuentos 2, 1, 15, 1; -- Actualizar el descuento con ID 3 al 15% con el tipo de descuento 2

-- Modo 3: Eliminación de un descuento existente
EXEC CUD_Descuentos 3, 3, NULL, NULL; -- Eliminar el descuento con ID 3

Select * from ProximaGen.proximagen.descuentos
