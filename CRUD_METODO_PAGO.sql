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
        -- Validar si el ID de M�todo de Pago ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[metodopago] WHERE metodo = @metodo)
        BEGIN
            -- Insertar un nuevo M�todo de Pago
            INSERT INTO [ProximaGen].[proximagen].[metodopago] (metodo)
            VALUES (@metodo);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El m�todo de pago ya existe. No se ha creado uno nuevo.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el ID de M�todo de Pago existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[metodopago] WHERE idMetodoPago = @idMetodoPago)
        BEGIN
            -- Actualizar un M�todo de Pago existente
            UPDATE [ProximaGen].[proximagen].[metodopago]
            SET metodo = @metodo
            WHERE idMetodoPago = @idMetodoPago;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de M�todo de Pago no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de M�todo de Pago existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[metodopago] WHERE idMetodoPago = @idMetodoPago)
        BEGIN
            -- Eliminar un M�todo de Pago existente
            DELETE FROM [ProximaGen].[proximagen].[metodopago]
            WHERE idMetodoPago = @idMetodoPago;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de M�todo de Pago no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo M�todo de Pago
EXEC CUD_MetodoPago 1, NULL, 'Transferencia';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un M�todo de Pago existente
EXEC CUD_MetodoPago 2, 1, 'Tarjeta de Cr�dito';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un M�todo de Pago existente
EXEC CUD_MetodoPago 3, 3, NULL;

Select * from ProximaGen.proximagen.metodopago