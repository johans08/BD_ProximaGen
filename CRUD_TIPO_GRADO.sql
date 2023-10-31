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
        -- Validar si el grado acad�mico ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipogrado] WHERE gradoAcademico = @gradoAcademico)
        BEGIN
            -- Insertar un nuevo grado acad�mico
            INSERT INTO [ProximaGen].[proximagen].[tipogrado] (gradoAcademico, duracion)
            VALUES (@gradoAcademico, @duracion);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El grado acad�mico ya existe. No se ha creado un nuevo grado acad�mico.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el grado acad�mico ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipogrado] WHERE gradoAcademico = @gradoAcademico)
        BEGIN
            -- Actualizar un grado acad�mico existente
            UPDATE [ProximaGen].[proximagen].[tipogrado]
            SET gradoAcademico = @gradoAcademico, duracion = @duracion
            WHERE idTipoGrado = @idTipoGrado;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El grado acad�mico ya existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Tipo de Grado existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipogrado] WHERE idTipoGrado = @idTipoGrado)
        BEGIN
            -- Eliminar un grado acad�mico existente
            DELETE FROM [ProximaGen].[proximagen].[tipogrado]
            WHERE idTipoGrado = @idTipoGrado;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Tipo de Grado no existe. No se ha realizado la eliminaci�n.';
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


-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Tipo de Grado
EXEC CUD_TipoGrado 1, NULL, 'Tecnico', 2;

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Tipo de Grado existente
EXEC CUD_TipoGrado 2, 1, 'Bachillerado', 3;

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Tipo de Grado existente
EXEC CUD_TipoGrado 3, 4, NULL, NULL;

Select * from ProximaGen.proximagen.tipogrado