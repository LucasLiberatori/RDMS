SELECT CONCAT("ALTER DEFINER='Lucas'@'host' VIEW ", table_name, " AS ", view_definition, ";") 
FROM information_schema.views WHERE table_schema='RCPD';

ALTER DEFINER='root'@'%' VIEW RCPD_VWPersonalFull AS 
SELECT 
    'RCPD'.'RCPD_Personal'.'CUIL' AS 'CUIL'
    ,'RCPD'.'RCPD_Personal'.'Apellido' AS 'Apellido'
    ,'RCPD'.'RCPD_Personal'.'Nombre' AS 'Nombre'
    ,'RCPD'.'RCPD_SexoSinDni'.'SexoSinDni' AS 'SexoSegunDni'
    ,'RCPD'.'RCPD_Genero'.'Genero' AS 'Genero'
    ,'RCPD'.'RCPD_Personal'.'FechaNacimiento' AS 'FechaNacimiento'
    ,'RCPD'.'RCPD_EstadoCivil'.'EstadoCivil' AS 'EstadoCivil'
    ,'RCPD'.'RCPD_TipoNacionalidad'.'TipoNacionalidad' AS 'TipoNacionalidad'
    ,'RCPD'.'RCPD_Nacionalidad'.'Nacionalidad' AS 'Nacionalidad'
    ,'RCPD'.'RCPD_Pais'.'NombrePais' AS 'NombrePais'
    ,'RCPD'.'RCPD_NivelMaximoEstudio'.'NivelMaximoEstudio' AS 'NivelMaximoEstudio'
    ,'RCPD'.'RCPD_Personal'.'TituloObtenido' AS 'TituloObtenido'
    ,'RCPD'.'RCPD_Provincia'.'NombreProvincia' AS 'NombreProvincia'
    ,'RCPD'.'RCPD_Localidad'.'NombreLocalidad' AS 'NombreLocalidad'
    ,'RCPD'.'RCPD_Personal'.'FechaInicioRelacionLaboral' AS 'FechaInicioRelacionLaboral'
    ,'RCPD'.'RCPD_Escalafon'.'EscalafonDescripcion' AS 'EscalafonDescripcion'
    ,'RCPD'.'RCPD_SistemaAcceso'.'SistemaAcceso' AS 'SistemaAcceso'
    ,'RCPD'.'RCPD_NivelCategoria'.'NivelCategoriaDescripcion' AS 'NivelCategoriaDescripcion'
    ,'RCPD'.'RCPD_Adicional'.'AdicionalDescripcion' AS 'AdicionalDescripcion'
    ,'RCPD'.'RCPD_Agrupamiento'.'AgrupamientoDescripcion' AS 'AgrupamientoDescripcion'
    ,'RCPD'.'RCPD_Grado'.'GradoDescripcion' AS 'GradoDescripcion'
    ,'RCPD'.'RCPD_TipoDiscapacidad'.'TipoDiscapacidad' AS 'TipoDiscapacidad'
    ,'RCPD'.'RCPD_AlcanceDiscapacidad'.'AlcanceDiscapacidad' AS 'AlcanceDiscapacidad'
    ,'RCPD'.'RCPD_Personal'.'NroCertificado' AS 'NroCertificado'
    ,'RCPD'.'RCPD_ValidezCertificado'.'ValidezCertificado' AS 'ValidezCertificado'
    ,'RCPD'.'RCPD_Personal'.'FechaDelCertificado' AS 'FechaDelCertificado'
    ,'RCPD'.'RCPD_Personal'.'FechaVencimientoCertificado' AS 'FechaVencimientoCertificado'
    ,'RCPD'.'RCPD_Personal'.'InstitucionEmisora' AS 'InstitucionEmisora'
    ,'RCPD'.'RCPD_RegimenEmision'.'RegimenEmision' AS 'RegimenEmision'
    ,'RCPD'.'RCPD_Personal'.'IdProvinciaCertificante' AS 'ProvinciaCertificante'
    ,'RCPD'.'RCPD_Personal'.'FechaDeBaja' AS 'FechaDeBaja'
    ,'RCPD'.'RCPD_Personal'.'MotivoBaja' AS 'MotivoBaja'
    ,'RCPD'.'RCPD_Personal'.'Observaciones' AS 'Observaciones'
    ,'RCPD'.'RCPD_SituacionDeRevista'.'DescripcionSituacionDeRevista' AS 'DescripcionSituacionDeRevista'
    ,'RCPD'.'RCPD_FuncionEjecutiva'.'FuncionEjecutivaDesc' AS 'FuncionEjecutivaDesc'
    ,'RCPD'.'RCPD_Personal'.'CFUOrganismo' AS 'CFUOrganismo' 
FROM 'RCPD'.'RCPD_Personal' straight_join 'RCPD'.'RCPD_Escalafon' 
    on (('RCPD'.'RCPD_Personal'.'IdEscalafonDesagregado' = 'RCPD'.'RCPD_Escalafon'.'IdEscalafon'))) 
    straight_join 'RCPD'.'RCPD_SexoSinDni' 
    on(('RCPD'.'RCPD_Personal'.'IdSexoSinDni' = 'RCPD'.'RCPD_SexoSinDni'.'IdSexoSinDni'))) 
    straight_join 'RCPD'.'RCPD_EstadoCivil' 
    on(('RCPD'.'RCPD_Personal'.'IdEstadoCivil' = 'RCPD'.'RCPD_EstadoCivil'.'IdEstadoCivil'))) 
    straight_join 'RCPD'.'RCPD_TipoNacionalidad' 
    on(('RCPD'.'RCPD_Personal'.'IdTipoNacionalidad' = 'RCPD'.'RCPD_TipoNacionalidad'.'IdTipoNacionalidad'))) 
    straight_join 'RCPD'.'RCPD_Nacionalidad' 
    on(('RCPD'.'RCPD_Personal'.'IdNacionalidad' = 'RCPD'.'RCPD_Nacionalidad'.'IdNacionalidad'))) 
    straight_join 'RCPD'.'RCPD_Pais' 
    on(('RCPD'.'RCPD_Personal'.'IdPaises' = 'RCPD'.'RCPD_Pais'.'IdPaises'))) 
    straight_join 'RCPD'.'RCPD_Provincia' 
    on(('RCPD'.'RCPD_Personal'.'IdProvincia' = 'RCPD'.'RCPD_Provincia'.'IdProvincia'))) 
    straight_join 'RCPD'.'RCPD_Localidad' 
    on(('RCPD'.'RCPD_Personal'.'IdLocalidad' = 'RCPD'.'RCPD_Localidad'.'IdLocalidad'))) 
    straight_join 'RCPD'.'RCPD_NivelMaximoEstudio' 
    on(('RCPD'.'RCPD_Personal'.'IdNivelMaximoEstudio' = 'RCPD'.'RCPD_NivelMaximoEstudio'.'IdNivelMaximoEstudio'))) 
    straight_join 'RCPD'.'RCPD_SistemaAcceso' 
    on(('RCPD'.'RCPD_Personal'.'IdSistemaAcceso' = 'RCPD'.'RCPD_SistemaAcceso'.'IdSistemaAcceso'))) 
    straight_join 'RCPD'.'RCPD_NivelCategoria' 
    on(('RCPD'.'RCPD_Personal'.'IdNivelCategoria' = 'RCPD'.'RCPD_NivelCategoria'.'IdNivelCategoria'))) 
    straight_join 'RCPD'.'RCPD_Agrupamiento' 
    on(('RCPD'.'RCPD_Personal'.'IdAgrupamiento' = 'RCPD'.'RCPD_Agrupamiento'.'IdAgrupamiento'))) 
    straight_join 'RCPD'.'RCPD_Adicional' 
    on(('RCPD'.'RCPD_Personal'.'IdAdicional' = 'RCPD'.'RCPD_Adicional'.'IdAdicional'))) 
    straight_join 'RCPD'.'RCPD_Grado' 
    on(('RCPD'.'RCPD_Personal'.'IdGrado' = 'RCPD'.'RCPD_Grado'.'IdGrado'))) 
    straight_join 'RCPD'.'RCPD_TipoDiscapacidad' 
    on(('RCPD'.'RCPD_Personal'.'IdTipoDiscapacidad' = 'RCPD'.'RCPD_TipoDiscapacidad'.'IdTipoDiscapacidad')))
    straight_join 'RCPD'.'RCPD_AlcanceDiscapacidad' 
    on(('RCPD'.'RCPD_Personal'.'IdAlcanceDiscapacidad' = 'RCPD'.'RCPD_AlcanceDiscapacidad'.'IdAlcanceDiscapacidad'))) 
    straight_join 'RCPD'.'RCPD_ValidezCertificado' 
    on(('RCPD'.'RCPD_Personal'.'IdValidezCertificado' = 'RCPD'.'RCPD_ValidezCertificado'.'IdValidezCertificado'))) 
    straight_join 'RCPD'.'RCPD_RegimenEmision' 
    on(('RCPD'.'RCPD_Personal'.'IdRegimenEmision' = 'RCPD'.'RCPD_RegimenEmision'.'IdRegimenEmision'))) 
    straight_join 'RCPD'.'RCPD_FuncionEjecutiva' 
    on(('RCPD'.'RCPD_Personal'.'IdFuncionEjecutiva' = 'RCPD'.'RCPD_FuncionEjecutiva'.'IdFuncionEjecutiva'))) 
    left join 'RCPD'.'RCPD_SituacionDeRevista' 
    on(('RCPD'.'RCPD_Personal'.'IdSituacionDeRevista' = 'RCPD'.'RCPD_SituacionDeRevista'.'IdSituacionDeRevista'))) 
    left join 'RCPD'.'RCPD_Genero' 
    on(('RCPD'.'RCPD_Personal'.'IdGenero' = 'RCPD'.'RCPD_Genero'.'IdGenero')));
