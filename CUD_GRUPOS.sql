-- Script CRUD para Grupos
CREATE PROCEDURE CUD_Grupos
(
    @modo INT,
    @idGrupo INT,
    @Cursos_idCurso INT,
    @Modalidades_idModalidad INT,
    @Aulas_idAula INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1 -- Modo de inserción
    BEGIN
        -- Validar si el Grupo ya existe
        IF NOT EXISTS (SELECT 1 FROM [proximagen].[proximagen].[grupos] WHERE Cursos_idCurso = @Cursos_idCurso AND Modalidades_idModalidad = @Modalidades_idModalidad AND Aulas_idAula = @Aulas_idAula)
        BEGIN
            -- Insertar un nuevo Grupo
            INSERT INTO [proximagen].[proximagen].[grupos] (Cursos_idCurso, Modalidades_idModalidad, Aulas_idAula)
            VALUES (@Cursos_idCurso, @Modalidades_idModalidad, @Aulas_idAula);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Grupo ya existe. No se ha creado un nuevo Grupo.';
        END
    END
    ELSE IF @modo = 2 -- Modo de actualización
    BEGIN
        -- Validar si el ID de Grupo existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[grupos] WHERE idGrupo = @idGrupo)
        BEGIN
            -- Actualizar un Grupo existente
            UPDATE [proximagen].[proximagen].[grupos]
            SET Cursos_idCurso = @Cursos_idCurso, Modalidades_idModalidad = @Modalidades_idModalidad, Aulas_idAula = @Aulas_idAula
            WHERE idGrupo = @idGrupo;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Grupo no existe. No se ha realizado la actualización.';
        END
    END
    ELSE IF @modo = 3 -- Modo de eliminación
    BEGIN
        -- Validar si el ID de Grupo existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[grupos] WHERE idGrupo = @idGrupo)
        BEGIN
            -- Eliminar un Grupo existente
            DELETE FROM [proximagen].[proximagen].[grupos]
            WHERE idGrupo = @idGrupo;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Grupo no existe. No se ha realizado la eliminación.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Grupo
EXEC CUD_Grupos 1, NULL, 1, 1, 1;

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Grupo existente
EXEC CUD_Grupos 2, 1, 2, 2, 2;

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Grupo existente
EXEC CUD_Grupos 3, 3, NULL, NULL, NULL;

-- Ejemplo de consulta SELECT para obtener datos de Grupos
SELECT [idGrupo]
      ,[Cursos_idCurso]
      ,[Modalidades_idModalidad]
      ,[Aulas_idAula]
  FROM [proximagen].[proximagen].[grupos];
