--SCRIPT CRUD MODALIDADES

CREATE PROCEDURE CUD_Modalidades
(
    @modo INT,
    @idModalidad INT,
    @modalidad NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si la modalidad ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[modalidades] WHERE modalidad = @modalidad)
        BEGIN
            -- Insertar una nueva modalidad
            INSERT INTO [ProximaGen].[proximagen].[modalidades] (modalidad)
            VALUES (@modalidad);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La modalidad ya existe. No se ha creado una nueva modalidad.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si la modalidad ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[modalidades] WHERE modalidad = @modalidad)
        BEGIN
			-- Validar si el ID de Modalidad existe antes de eliminar
			IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[modalidades] WHERE idModalidad = @idModalidad)
			BEGIN
				-- Actualizar una modalidad existente
				UPDATE [ProximaGen].[proximagen].[modalidades]
				SET modalidad = @modalidad
				WHERE idModalidad = @idModalidad;
				SET @creado = 1;
			END
			ELSE
			BEGIN
				PRINT 'El ID de Modalidad no existe. No se ha realizado la actualización.';
			END
        END
        ELSE
        BEGIN
            PRINT 'La modalidad ya existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Modalidad existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[modalidades] WHERE idModalidad = @idModalidad)
        BEGIN
            -- Eliminar una modalidad existente
            DELETE FROM [ProximaGen].[proximagen].[modalidades]
            WHERE idModalidad = @idModalidad;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Modalidad no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar una nueva Modalidad
EXEC CUD_Modalidades 1, NULL, 'Presencial';

-- Ejemplo de llamada al procedimiento almacenado para actualizar una Modalidad existente
EXEC CUD_Modalidades 2, 1, 'Virtualidad';

-- Ejemplo de llamada al procedimiento almacenado para eliminar una Modalidad existente
EXEC CUD_Modalidades 3, 3, NULL;

Select * from ProximaGen.proximagen.modalidades
