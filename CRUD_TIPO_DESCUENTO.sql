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
        -- Validar si el tipo de descuento ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipodescuento] WHERE tipoDescuento = @tipoDescuento)
        BEGIN
            -- Insertar un nuevo tipo de descuento
            INSERT INTO [ProximaGen].[proximagen].[tipodescuento] (tipoDescuento)
            VALUES (@tipoDescuento);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El tipo de descuento ya existe. No se ha creado un nuevo tipo de descuento.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el tipo de descuento ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipodescuento] WHERE tipoDescuento = @tipoDescuento)
        BEGIN
            -- Actualizar un tipo de descuento existente
            UPDATE [ProximaGen].[proximagen].[tipodescuento]
            SET tipoDescuento = @tipoDescuento
            WHERE idTipoDescuento = @idTipoDescuento;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El tipo de descuento ya existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Tipo de Descuento existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipodescuento] WHERE idTipoDescuento = @idTipoDescuento)
        BEGIN
            -- Eliminar un tipo de descuento existente
            DELETE FROM [ProximaGen].[proximagen].[tipodescuento]
            WHERE idTipoDescuento = @idTipoDescuento;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Tipo de Descuento no existe. No se ha realizado la eliminaci�n.';
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


-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Tipo de Descuento
EXEC CUD_TipoDescuento 1, NULL, 'Descuento 30%';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Tipo de Descuento existente
EXEC CUD_TipoDescuento 2, 1, 'Descuento 15%';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Tipo de Descuento existente
EXEC CUD_TipoDescuento 3, 3, NULL;

Select * from ProximaGen.proximagen.tipodescuento