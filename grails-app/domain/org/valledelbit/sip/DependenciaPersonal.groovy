package org.valledelbit.sip

class DependenciaPersonal {
	String noDependenciaPersonal
	Personal personal
	Dependencia dependencia
	Puesto puesto
	Date fechaIngreso
	String usuario
	String contrasena

	String toString() {
		return "$noDependenciaPersonal - $personal"
	}

    static constraints = {
		noDependenciaPersonal maxSize: 10, blank: false
		personal blank: false
		dependencia blank: false
		puesto blank: false
		fechaIngreso max: new Date(), blank:false
		usuario maxSize: 25, blank: false
		contrasena maxSize: 25, blank: false
    }
}