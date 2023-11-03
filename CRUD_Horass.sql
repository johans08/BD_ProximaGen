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
            -- Insertar una nueva hora
            INSERT INTO [ProximaGen].[proximagen].[horas] (HoraInicio, HoraFin)
            VALUES (@HoraInicio, @HoraFin);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El rango de horas ya existe. No se ha creado una nueva hora.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si el rango de horas ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[horas] WHERE HoraInicio = @HoraInicio AND HoraFin = @HoraFin)
        BEGIN
			-- Validar si el ID de Hora existe antes de eliminar
			IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[horas] WHERE idHora = @idHora)
			BEGIN
				-- Actualizar una hora existente
				UPDATE [ProximaGen].[proximagen].[horas]
				SET HoraInicio = @HoraInicio, HoraFin = @HoraFin
				WHERE idHora = @idHora;
				SET @creado = 1;
			END
			ELSE
			BEGIN
				PRINT 'El ID de Hora no existe. No se ha realizado la actualización.';
			END
        END
        ELSE
        BEGIN
            PRINT 'El rango de horas ya existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Hora existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[horas] WHERE idHora = @idHora)
        BEGIN
            -- Eliminar una hora existente
            DELETE FROM [ProximaGen].[proximagen].[horas]
            WHERE idHora = @idHora;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Hora no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar una nueva Hora
EXEC CUD_Horas 1, NULL, '06:30:00', '10:30:00';

-- Ejemplo de llamada al procedimiento almacenado para actualizar una Hora existente
EXEC CUD_Horas 2, 1, '08:00:00', '11:00:00';

-- Ejemplo de llamada al procedimiento almacenado para eliminar una Hora existente
EXEC CUD_Horas 3, 3, NULL, NULL;

Select * from ProximaGen.proximagen.horas
