-- Script CRUD para Horarios
drop procedure CUD_Horarios
CREATE PROCEDURE CUD_Horarios
(
    @modo INT,
    @idHorario INT,
    @horario VARCHAR(255),
    @Dias_idDia INT,
    @Horas_idHora INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1 -- Modo de inserci�n
    BEGIN
        -- Validar si el Horario ya existe
        IF NOT EXISTS (SELECT 1 FROM [proximagen].[proximagen].[horarios] WHERE horario = @horario AND Dias_idDia = @Dias_idDia AND Horas_idHora = @Horas_idHora)
        BEGIN
            -- Insertar un nuevo Horario
            INSERT INTO [proximagen].[proximagen].[horarios] (horario, Dias_idDia, Horas_idHora)
            VALUES (@horario, @Dias_idDia, @Horas_idHora);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Horario ya existe. No se ha creado un nuevo Horario.';
        END
    END
    ELSE IF @modo = 2 -- Modo de actualizaci�n
    BEGIN
        -- Validar si el ID de Horario existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[horarios] WHERE idHorario = @idHorario)
        BEGIN
            -- Actualizar un Horario existente
            UPDATE [proximagen].[proximagen].[horarios]
            SET horario = @horario, Dias_idDia = @Dias_idDia, Horas_idHora = @Horas_idHora
            WHERE idHorario = @idHorario;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Horario no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3 -- Modo de eliminaci�n
    BEGIN
        -- Validar si el ID de Horario existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[horarios] WHERE idHorario = @idHorario)
        BEGIN
            -- Eliminar un Horario existente
            DELETE FROM [proximagen].[proximagen].[horarios]
            WHERE idHorario = @idHorario;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Horario no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Horario
EXEC CUD_Horarios 1, NULL, 'Horario de prueba', 1, 1;

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Horario existente
EXEC CUD_Horarios 2, 1, 'Horario actualizado', 2, 2;

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Horario existente
EXEC CUD_Horarios 3, 3, NULL, NULL;

-- Ejemplo de consulta SELECT para obtener datos de Horarios
SELECT [idHorario]
      ,[horario]
      ,[Dias_idDia]
      ,[Horas_idHora]
  FROM [proximagen].[proximagen].[horarios];
