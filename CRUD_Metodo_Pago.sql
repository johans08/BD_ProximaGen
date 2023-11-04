--SCRIPT CRUD METODO PAGO

CREATE PROCEDURE CUD_MetodoPago
(
    @modo INT,
    @idMetodoPago INT,
    @metodo NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el método de pago ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[metodopago] WHERE metodo = @metodo)
        BEGIN
            -- Insertar un nuevo método de pago
            INSERT INTO [ProximaGen].[proximagen].[metodopago] (metodo)
            VALUES (@metodo);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El método de pago ya existe. No se ha creado un nuevo método de pago.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el método de pago ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[metodopago] WHERE metodo = @metodo)
        BEGIN
			-- Validar si el ID de Método de Pago existe antes de eliminar
			IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[metodopago] WHERE idMetodoPago = @idMetodoPago)
			BEGIN
				-- Actualizar un método de pago existente
				UPDATE [ProximaGen].[proximagen].[metodopago]
				SET metodo = @metodo
				WHERE idMetodoPago = @idMetodoPago;
				SET @creado = 1;
			END
			ELSE
			BEGIN
				PRINT 'El ID de Método de Pago no existe. No se ha realizado la actualización.';
			END
        END
        ELSE
        BEGIN
            PRINT 'El método de pago ya existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Método de Pago existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[metodopago] WHERE idMetodoPago = @idMetodoPago)
        BEGIN
            -- Eliminar un método de pago existente
            DELETE FROM [ProximaGen].[proximagen].[metodopago]
            WHERE idMetodoPago = @idMetodoPago;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Método de Pago no existe. No se ha realizado la eliminación.';
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
        SELECT 'La operación se ha completado con éxito.' as response
    END
END;

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Método de Pago
EXEC CUD_MetodoPago 1, NULL, 'Sinpe móvil';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Método de Pago existente
EXEC CUD_MetodoPago 2, 1, 'Tarjeta de Crédito';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Método de Pago existente
EXEC CUD_MetodoPago 3, 4, NULL;

Select * from ProximaGen.proximagen.metodopago
