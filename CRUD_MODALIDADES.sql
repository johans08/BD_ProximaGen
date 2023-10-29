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
        -- Validar si el ID de modalidad existe antes de actualizar
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
            PRINT 'El ID de modalidad no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de modalidad existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[modalidades] WHERE idModalidad = @idModalidad)
        BEGIN
            -- Eliminar una modalidad existente
            DELETE FROM [ProximaGen].[proximagen].[modalidades]
            WHERE idModalidad = @idModalidad;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de modalidad no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar una nueva Modalidad
EXEC CUD_Modalidades 1, NULL, 'Virtual';
EXEC CUD_Modalidades 1, NULL, 'Presencial';

-- Ejemplo de llamada al procedimiento almacenado para actualizar una Modalidad existente
EXEC CUD_Modalidades 2, 1, 'Virtualidad';

-- Ejemplo de llamada al procedimiento almacenado para eliminar una Modalidad existente
EXEC CUD_Modalidades 3, 2, NULL;

Select * from ProximaGen.proximagen.modalidades