package org.valledelbit.sip

class PredioPropietario {
	String noPredioPropietario
	Predio predio 
	Habitante habitante 
	Date fechaInicioPropiedad 
	Date fechaFinPropiedad 
	Boolean statusPropiedad
	String descripcion 
	Boolean drenaje
	Boolean empedrado
	Boolean alumbrado
	Boolean aguaPotable
	Boolean pavimento

    static constraints = {
		noPredioPropietario maxSize: 25, blank: false
		predio maxSize: 25, blank: false
		habitante maxSize: 25, blank: false
		fechaInicioPropiedad max: new Date(), blank: false 
		fechaFinPropiedad max: new Date(), blank: false
		statusPropiedad blank: false
		descripcion maxSize: 50, blank: false
		drenaje blank: false
		empedrado blank: false
		alumbrado blank: false
		aguaPotable blank: false
		pavimento blank: false
    }
}
