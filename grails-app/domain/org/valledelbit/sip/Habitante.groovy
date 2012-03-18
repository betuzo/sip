package org.valledelbit.sip

class Habitante {
	String noHabitante
	String datosHabitante
	Calle calle
	String descDomicilio

	String toString() {
		return "$noHabitante - $datosHabitante"
	}
	
	static constraints = {
		noHabitante maxSize: 10, blank:false
		datosHabitante maxSize: 70, blank:false
		calle maxSize: 70, blank:false
		descDomicilio maxSize: 100, blank:true
	}
}