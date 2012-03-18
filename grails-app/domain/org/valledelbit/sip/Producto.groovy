package org.valledelbit.sip

class Producto {
	String noProducto
	String marca
	String nombre
	String descripcion

    static constraints = {
		noProducto	maxSize: 10, blank: false
		marca	maxSize: 30, blank: false
		nombre	maxSize: 60, blank: false
		descripcion	maxSize: 100
    }
}