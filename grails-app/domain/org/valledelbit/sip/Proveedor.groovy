package org.valledelbit.sip

class Proveedor {
	String noProveedor
	String razonSocial
	String telefono
	String direccion
	String nombreDelRepresentante
	String email

    static constraints = {
		noProveedor	maxSize: 10, blank: false
		razonSocial	maxSize: 50, blank: false
		telefono	maxSize: 10
		direccion	maxSize: 100, blank: false
		nombreDelRepresentante	maxSize: 100, blank: false
		email email: true, blank: false
    }
}
