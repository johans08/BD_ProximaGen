-- Script CRUD para Cursos
drop procedure cud_cursos
CREATE PROCEDURE CUD_Cursos
(
    @modo INT,
    @idCurso INT,
    @curso VARCHAR(255),
    @requisito VARCHAR(255),
    @creditos INT,
    @Estados_idEstado INT,
    @Precios_idPrecio INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1 -- Modo de inserci�n
    BEGIN
        -- Validar si el Curso ya existe
        IF NOT EXISTS (SELECT 1 FROM [proximagen].[proximagen].[cursos] WHERE curso = @curso)
        BEGIN
            -- Insertar un nuevo Curso
            INSERT INTO [proximagen].[proximagen].[cursos] (curso, requisito, creditos, Estados_idEstado, Precios_idPrecio)
            VALUES (@curso, @requisito, @creditos, @Estados_idEstado, @Precios_idPrecio);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Curso ya existe. No se ha creado un nuevo Curso.';
        END
    END
    ELSE IF @modo = 2 -- Modo de actualizaci�n
    BEGIN
        -- Validar si el ID de Curso existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[cursos] WHERE idCurso = @idCurso)
        BEGIN
            -- Actualizar un Curso existente
            UPDATE [proximagen].[proximagen].[cursos]
            SET curso = @curso, requisito = @requisito, creditos = @creditos, Estados_idEstado = @Estados_idEstado, Precios_idPrecio = @Precios_idPrecio
            WHERE idCurso = @idCurso;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Curso no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3 -- Modo de eliminaci�n
    BEGIN
        -- Validar si el ID de Curso existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[cursos] WHERE idCurso = @idCurso)
        BEGIN
            -- Eliminar un Curso existente
            DELETE FROM [proximagen].[proximagen].[cursos]
            WHERE idCurso = @idCurso;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Curso no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Curso
EXEC CUD_Cursos 1, NULL, 'prueba', 'dos', 3, 2, 1;

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Curso existente
EXEC CUD_Cursos 2, 1, 'Curso actualizado', 'Nuevo requisito', 4, 2, 2;

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Curso existente
EXEC CUD_Cursos 3, 3, NULL, NULL, NULL, NULL, NULL;

-- Ejemplo de consulta SELECT para obtener datos de Cursos


SELECT *
  FROM [proximagen].[proximagen].[cursos]
