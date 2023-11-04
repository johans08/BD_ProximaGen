--SCRIPT CRUD TIPO GRADO

CREATE PROCEDURE CUD_TipoGrado
(
    @modo INT,
    @idTipoGrado INT,
    @gradoAcademico NVARCHAR(50),
    @duracion INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el grado académico ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipogrado] WHERE gradoAcademico = @gradoAcademico)
        BEGIN
            -- Insertar un nuevo grado académico
            INSERT INTO [ProximaGen].[proximagen].[tipogrado] (gradoAcademico, duracion)
            VALUES (@gradoAcademico, @duracion);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El grado académico ya existe. No se ha creado un nuevo grado académico.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el grado académico ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipogrado] WHERE gradoAcademico = @gradoAcademico)
        BEGIN
			-- Validar si el ID de Tipo de Grado existe antes de eliminar
			IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipogrado] WHERE idTipoGrado = @idTipoGrado)
			BEGIN
				-- Actualizar un grado académico existente
				UPDATE [ProximaGen].[proximagen].[tipogrado]
				SET gradoAcademico = @gradoAcademico, duracion = @duracion
				WHERE idTipoGrado = @idTipoGrado;
				SET @creado = 1;
			END
			ELSE
			BEGIN
				PRINT 'El ID de Tipo de Grado no existe. No se ha realizado la eliminación.';
			END
        END
        ELSE
        BEGIN
            PRINT 'El grado académico ya existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Tipo de Grado existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipogrado] WHERE idTipoGrado = @idTipoGrado)
        BEGIN
            -- Eliminar un grado académico existente
            DELETE FROM [ProximaGen].[proximagen].[tipogrado]
            WHERE idTipoGrado = @idTipoGrado;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Tipo de Grado no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Tipo de Grado
EXEC CUD_TipoGrado 1, NULL, 'Tecnico', 2;

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Tipo de Grado existente
EXEC CUD_TipoGrado 2, 1, 'Bachillerado', 3;

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Tipo de Grado existente
EXEC CUD_TipoGrado 3, 2, NULL, NULL;

Select * from ProximaGen.proximagen.tipogrado
