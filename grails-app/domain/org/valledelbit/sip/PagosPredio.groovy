package org.valledelbit.sip

class PagosPredio {
	String noPago
	String folio
	Date fecha
	Predio predio
	DependenciaPersonal dependenciaPersonal
	Habitante habitante
	String cantidad
	String concepto
	PredioValor predioValor
	String descripcion

	String toString() {
		return "$noPago - $folio"
	}

	static constraints = {
		noPago maxSize: 10, blank:false
		folio maxSize: 25, blank:false
		fecha max: new Date(), blank:false
		predio maxSize: 25, blank:false
		dependenciaPersonal blank:false
		habitante blank:false
		cantidad maxSize: 25, blank:false
		concepto maxSize: 25, blank:false
		predioValor blank:false
		descripcion maxSize: 100, blank:false
	}
}
