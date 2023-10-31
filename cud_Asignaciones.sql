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

    IF @modo = 1 -- Modo de inserci�n
    BEGIN
        -- Validar si la Asignaci�n ya existe
        IF NOT EXISTS (SELECT 1 FROM [proximagen].[proximagen].[asignaciones] WHERE titulo = @titulo AND descripcion = @descripcion AND archivo = @archivo AND Grupos_idGrupo = @Grupos_idGrupo)
        BEGIN
            -- Insertar una nueva Asignaci�n
            INSERT INTO [proximagen].[proximagen].[asignaciones] (titulo, descripcion, archivo, Grupos_idGrupo)
            VALUES (@titulo, @descripcion, @archivo, @Grupos_idGrupo);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La Asignaci�n ya existe. No se ha creado una nueva Asignaci�n.';
        END
    END
    ELSE IF @modo = 2 -- Modo de actualizaci�n
    BEGIN
        -- Validar si el ID de Asignaci�n existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[asignaciones] WHERE idAsignacion = @idAsignacion)
        BEGIN
            -- Actualizar una Asignaci�n existente
            UPDATE [proximagen].[proximagen].[asignaciones]
            SET titulo = @titulo, descripcion = @descripcion, archivo = @archivo, Grupos_idGrupo = @Grupos_idGrupo
            WHERE idAsignacion = @idAsignacion;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Asignaci�n no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3 -- Modo de eliminaci�n
    BEGIN
        -- Validar si el ID de Asignaci�n existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[asignaciones] WHERE idAsignacion = @idAsignacion)
        BEGIN
            -- Eliminar una Asignaci�n existente
            DELETE FROM [proximagen].[proximagen].[asignaciones]
            WHERE idAsignacion = @idAsignacion;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Asignaci�n no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar una nueva Asignaci�n
EXEC CUD_Asignaciones 1, NULL, 'Tarea 2', 'Descripci�n de la tarea 2', 'archivo2.pdf', 2;

-- Ejemplo de llamada al procedimiento almacenado para actualizar una Asignaci�n existente
EXEC CUD_Asignaciones 2, 1, 'Tarea 1 Actualizada', 'Nueva descripci�n', 'archivo_actualizado.pdf', 2;

-- Ejemplo de llamada al procedimiento almacenado para eliminar una Asignaci�n existente
EXEC CUD_Asignaciones 3, 3, NULL, NULL, NULL;

-- Ejemplo de consulta SELECT para obtener datos de Asignaciones
SELECT [idAsignacion]
      ,[titulo]
      ,[descripcion]
      ,[archivo]
      ,[Grupos_idGrupo]
  FROM [proximagen].[proximagen].[asignaciones];
