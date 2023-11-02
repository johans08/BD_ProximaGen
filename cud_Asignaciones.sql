-- Script CRUD para Asignaciones
drop procedure cud_Asignaciones
CREATE PROCEDURE CUD_Asignaciones
(
    @modo INT,
    @idAsignacion INT,
    @titulo VARCHAR(255),
    @descripcion VARCHAR(255),
    @archivo VARCHAR(255),
    @Grupos_idGrupo INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1 -- Modo de inserción
    BEGIN
        -- Validar si la Asignación ya existe
        IF NOT EXISTS (SELECT 1 FROM [proximagen].[proximagen].[asignaciones] WHERE titulo = @titulo AND descripcion = @descripcion AND archivo = @archivo AND Grupos_idGrupo = @Grupos_idGrupo)
        BEGIN
            -- Insertar una nueva Asignación
            INSERT INTO [proximagen].[proximagen].[asignaciones] (titulo, descripcion, archivo, Grupos_idGrupo)
            VALUES (@titulo, @descripcion, @archivo, @Grupos_idGrupo);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La Asignación ya existe. No se ha creado una nueva Asignación.';
        END
    END
    ELSE IF @modo = 2 -- Modo de actualización
    BEGIN
        -- Validar si el ID de Asignación existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[asignaciones] WHERE idAsignacion = @idAsignacion)
        BEGIN
            -- Actualizar una Asignación existente
            UPDATE [proximagen].[proximagen].[asignaciones]
            SET titulo = @titulo, descripcion = @descripcion, archivo = @archivo, Grupos_idGrupo = @Grupos_idGrupo
            WHERE idAsignacion = @idAsignacion;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Asignación no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3 -- Modo de eliminación
    BEGIN
        -- Validar si el ID de Asignación existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[asignaciones] WHERE idAsignacion = @idAsignacion)
        BEGIN
            -- Eliminar una Asignación existente
            DELETE FROM [proximagen].[proximagen].[asignaciones]
            WHERE idAsignacion = @idAsignacion;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Asignación no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar una nueva Asignación
EXEC CUD_Asignaciones 1, NULL, 'Tarea 2', 'Descripción de la tarea 2', 'archivo2.pdf', 2;

-- Ejemplo de llamada al procedimiento almacenado para actualizar una Asignación existente
EXEC CUD_Asignaciones 2, 1, 'Tarea 1 Actualizada', 'Nueva descripción', 'archivo_actualizado.pdf', 2;

-- Ejemplo de llamada al procedimiento almacenado para eliminar una Asignación existente
EXEC CUD_Asignaciones 3, 3, NULL, NULL, NULL;

-- Ejemplo de consulta SELECT para obtener datos de Asignaciones
SELECT [idAsignacion]
      ,[titulo]
      ,[descripcion]
      ,[archivo]
      ,[Grupos_idGrupo]
  FROM [proximagen].[proximagen].[asignaciones];
