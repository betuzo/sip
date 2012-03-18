package org.valledelbit.sip

class Personal {
    String noPersonal
	String nombre
	String apellidoPaterno
	String apellidoMaterno
	String sexo
	Date fechaNacimiento
	String email

	String toString() {
		return "$noPersonal - $nombre"
	}

    static constraints = {
		noPersonal	maxSize: 10, blank: false
		nombre	maxSize: 60, blank: false
		apellidoPaterno	maxSize: 40, blank: false
		apellidoMaterno	maxSize: 40, blank: false
		sexo maxSize: 20, blank: false
		fechaNacimiento max: new Date(), blank: false 
		email email: true, blank: false
    }
}
