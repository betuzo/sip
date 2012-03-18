package org.valledelbit.sip

class Predio {
	String noPredio
	TipoPredio tipoPredio
	String datosPred
	Calle calle
	String descDomicilio

	String toString() {
		return "$noPredio - $datosPred"
	}

    static constraints = {
		noPredio maxSize: 10, blank: false
		tipoPredio blank: false
		datosPred maxSize: 25, blank: false  
		calle blank: false  
		descDomicilio maxSize: 50  
    }
}
