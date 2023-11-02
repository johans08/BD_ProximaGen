-- Script CRUD para Usuarios
CREATE PROCEDURE CUD_Usuarios
(
    @modo INT,
    @idUsuario INT,
    @nombreUsuario VARCHAR(45),
    @contrasenna VARCHAR(45),
    @correo VARCHAR(45),
    @Roles_idRol INT,
    @Personas_idPersona INT,
    @Estados_idEstado INT
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1 -- Modo de inserci�n
    BEGIN
        -- Validar si el Usuario ya existe
        IF NOT EXISTS (SELECT 1 FROM [proximagen].[proximagen].[usuarios] WHERE nombreUsuario = @nombreUsuario AND correo = @correo)
        BEGIN
            -- Insertar un nuevo Usuario
            INSERT INTO [proximagen].[proximagen].[usuarios] (nombreUsuario, contrasenna, correo, Roles_idRol, Personas_idPersona, Estados_idEstado)
            VALUES (@nombreUsuario, @contrasenna, @correo, @Roles_idRol, @Personas_idPersona, @Estados_idEstado);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El Usuario ya existe. No se ha creado un nuevo Usuario.';
        END
    END
    ELSE IF @modo = 2 -- Modo de actualizaci�n
    BEGIN
        -- Validar si el ID de Usuario existe antes de actualizar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[usuarios] WHERE idUsuario = @idUsuario)
        BEGIN
            -- Actualizar un Usuario existente
            UPDATE [proximagen].[proximagen].[usuarios]
            SET nombreUsuario = @nombreUsuario, contrasenna = @contrasenna, correo = @correo, Roles_idRol = @Roles_idRol, Personas_idPersona = @Personas_idPersona, Estados_idEstado = @Estados_idEstado
            WHERE idUsuario = @idUsuario;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Usuario no existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3 -- Modo de eliminaci�n
    BEGIN
        -- Validar si el ID de Usuario existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [proximagen].[proximagen].[usuarios] WHERE idUsuario = @idUsuario)
        BEGIN
            -- Eliminar un Usuario existente
            DELETE FROM [proximagen].[proximagen].[usuarios]
            WHERE idUsuario = @idUsuario;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Usuario no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo Usuario
EXEC CUD_Usuarios 1, NULL, 'UsuarioNuevo', 'contrasenna123', 'usuario@example.com', 1, 2, 2;

-- Ejemplo de llamada al procedimiento almacenado para actualizar un Usuario existente
EXEC CUD_Usuarios 2, 1, 'UsuarioActualizado', 'nuevacontrasenna', 'nuevo_correo@example.com', 2, 2, 2;

-- Ejemplo de llamada al procedimiento almacenado para eliminar un Usuario existente
EXEC CUD_Usuarios 3, 3, NULL, NULL, NULL, NULL, NULL, NULL;

-- Ejemplo de consulta SELECT para obtener datos de Usuarios
SELECT [idUsuario]
      ,[nombreUsuario]
      ,[contrasenna]
      ,[correo]
      ,[Roles_idRol]
      ,[Personas_idPersona]
      ,[Estados_idEstado]
  FROM [proximagen].[proximagen].[usuarios];


  