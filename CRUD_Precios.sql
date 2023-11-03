--SCRIPT CRUD PRECIOS
CREATE PROCEDURE CUD_Precios
(
    @modo INT,
    @idPrecio INT,
    @precio DECIMAL(10, 2)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el precio ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[precios] WHERE precio = @precio)
        BEGIN
            -- Insertar un nuevo precio
            INSERT INTO [ProximaGen].[proximagen].[precios] (precio)
            VALUES (@precio);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El precio ya existe. No se ha creado un nuevo precio.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el precio ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[precios] WHERE precio = @precio)
        BEGIN
			-- Validar si el ID de Precio existe antes de actualizar
			IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[precios] WHERE idPrecio = @idPrecio)
			BEGIN
				-- Actualizar un precio existente
				UPDATE [ProximaGen].[proximagen].[precios]
				SET precio = @precio
				WHERE idPrecio = @idPrecio;
				SET @creado = 1;
			END
			ELSE
			BEGIN
				PRINT 'El ID de Precio no existe. No se ha realizado la actualización.';
			END
        END
        ELSE
        BEGIN
            PRINT 'El precio ya existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Precio existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[precios] WHERE idPrecio = @idPrecio)
        BEGIN
            -- Eliminar un precio existente
            DELETE FROM [ProximaGen].[proximagen].[precios]
            WHERE idPrecio = @idPrecio;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Precio no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Precio
EXEC CUD_Precios 1, NULL, 20.52;

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Precio existente
EXEC CUD_Precios 2, 1, 15.00;

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Precio existente
EXEC CUD_Precios 3, 3, NULL;

Select * from ProximaGen.proximagen.precios
