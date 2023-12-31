--SCRIPT CRUD HORAS

CREATE PROCEDURE CUD_Horas
(
    @modo INT,
    @idHora INT,
    @HoraInicio TIME,
    @HoraFin TIME
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si el rango de horas ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[horas] WHERE HoraInicio = @HoraInicio AND HoraFin = @HoraFin)
        BEGIN
            -- Insertar un nuevo rango de horas
            INSERT INTO [ProximaGen].[proximagen].[horas] (HoraInicio, HoraFin)
            VALUES (@HoraInicio, @HoraFin);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El rango de horas ya existe. No se ha creado un nuevo rango de horas.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el rango de horas ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[horas] WHERE HoraInicio = @HoraInicio AND HoraFin = @HoraFin)
        BEGIN
            -- Actualizar un rango de horas existente
            UPDATE [ProximaGen].[proximagen].[horas]
            SET HoraInicio = @HoraInicio, HoraFin = @HoraFin
            WHERE idHora = @idHora;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El rango de horas ya existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Hora existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[horas] WHERE idHora = @idHora)
        BEGIN
            -- Eliminar un rango de horas existente
            DELETE FROM [ProximaGen].[proximagen].[horas]
            WHERE idHora = @idHora;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Hora no existe. No se ha realizado la eliminaci�n.';
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


-- Ejemplo de llamada al procedimiento almacenado para insertar una nueva Hora
EXEC CUD_Horas 1, NULL, '06:30:00', '10:30:00';

-- Ejemplo de llamada al procedimiento almacenado para actualizar una Hora existente
EXEC CUD_Horas 2, 1, '08:00:00', '11:00:00';

-- Ejemplo de llamada al procedimiento almacenado para eliminar una Hora existente
EXEC CUD_Horas 3, 5, NULL, NULL;

Select * from ProximaGen.proximagen.horas