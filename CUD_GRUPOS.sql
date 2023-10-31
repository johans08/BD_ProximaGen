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

    IF @modo = 1 -- Modo de inserci�n
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
    ELSE IF @modo = 2 -- Modo de actualizaci�n
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
            PRINT 'El ID de Grupo no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3 -- Modo de eliminaci�n
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
            PRINT 'El ID de Grupo no existe. No se ha realizado la eliminaci�n.';
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
