-- SCRIPT CRUD TIPO CONTACTOS
CREATE PROCEDURE CUD_Tipo_Contactos
(
    @modo INT,
    @idTipoContacto INT,
    @descripcionTipoContacto NVARCHAR(50)
)
AS
BEGIN
    DECLARE @creado INT = 0;

    IF @modo = 1
    BEGIN
        -- Validar si la descripci�n del tipo de contacto ya existe
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE descripcionTipoContacto = @descripcionTipoContacto)
        BEGIN
            -- Insertar un nuevo tipo de contacto
            INSERT INTO [ProximaGen].[proximagen].[tipocontactos] (descripcionTipoContacto)
            VALUES (@descripcionTipoContacto);
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'La descripci�n del tipo de contacto ya existe. No se ha creado un nuevo tipo de contacto.';
        END
    END
    ELSE IF @modo = 2
    BEGIN
        -- Validar si la descripci�n del tipo de contacto ya existe antes de actualizar
        IF NOT EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE descripcionTipoContacto = @descripcionTipoContacto)
        BEGIN
			-- Validar si el ID de Tipo de Contacto existe antes de eliminar
			IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE idTipoContacto = @idTipoContacto)
			BEGIN
				-- Actualizar un tipo de contacto existente
				UPDATE [ProximaGen].[proximagen].[tipocontactos]
				SET descripcionTipoContacto = @descripcionTipoContacto
				WHERE idTipoContacto = @idTipoContacto;
				SET @creado = 1;
			END
			ELSE
			BEGIN
				PRINT 'El ID de Tipo de Contacto no existe. No se ha realizado la eliminaci�n.';
			END
        END
        ELSE
        BEGIN
            PRINT 'La descripci�n del tipo de contacto ya existe. No se ha realizado la actualizaci�n.';
        END
    END
    ELSE IF @modo = 3
    BEGIN
        -- Validar si el ID de Tipo de Contacto existe antes de eliminar
        IF EXISTS (SELECT 1 FROM [ProximaGen].[proximagen].[tipocontactos] WHERE idTipoContacto = @idTipoContacto)
        BEGIN
            -- Eliminar un tipo de contacto existente
            DELETE FROM [ProximaGen].[proximagen].[tipocontactos]
            WHERE idTipoContacto = @idTipoContacto;
            SET @creado = 1;
        END
        ELSE
        BEGIN
            PRINT 'El ID de Tipo de Contacto no existe. No se ha realizado la eliminaci�n.';
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

-- Ejemplo de llamada al procedimiento almacenado para insertar un nuevo estado
EXEC CUD_Tipo_Contactos 1, null, 'Correo electr�nicos';

-- Ejemplo de llamada al procedimiento almacenado para actualizar un estado existente
EXEC CUD_Tipo_Contactos 2, 1, 'Celular';

-- Ejemplo de llamada al procedimiento almacenado para eliminar un estado existente
EXEC CUD_Tipo_Contactos 3, 2, NULL;

Select * from ProximaGen.proximagen.tipocontactos