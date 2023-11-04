-- SCRIPT CRUD ESTADOS

CREATE PROCEDURE CUD_Estados
(
    @modo INT,
    @idEstado INT,
    @descripcionEstado NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si la descripción del estado ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[estados] WHERE descripcionEstado = @descripcionEstado)
        BEGIN
            -- Insertar un nuevo estado
            INSERT INTO [ProximaGen].[proximagen].[estados] (descripcionEstado)
            VALUES (@descripcionEstado);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La descripción del estado ya existe. No se ha creado un nuevo estado.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si la descripción del estado ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[estados] WHERE descripcionEstado = @descripcionEstado)
        BEGIN
			-- Validar si el ID de Estado existe antes de eliminar
			IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[estados] WHERE idEstado = @idEstado)
			BEGIN
				-- Actualizar un estado existente
				UPDATE [ProximaGen].[proximagen].[estados]
				SET descripcionEstado = @descripcionEstado
				WHERE idEstado = @idEstado;
				SET @creado = 1;
			END
			ELSE
			BEGIN
				PRINT 'El ID de Estado no existe. No se ha realizado la eliminación.';
			END
        END
        ELSE
        BEGIN
            PRINT 'La descripción del estado ya existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Estado existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[estados] WHERE idEstado = @idEstado)
        BEGIN
            -- Eliminar un estado existente
            DELETE FROM [ProximaGen].[proximagen].[estados]
            WHERE idEstado = @idEstado;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Estado no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo estado
EXEC CUD_Estados 1, null, 'Esperando 3';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un estado existente
EXEC CUD_Estados 2, 1, 'Esperando 4';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un estado existente
EXEC CUD_Estados 3, 3, NULL;

Select * from ProximaGen.proximagen.estados
