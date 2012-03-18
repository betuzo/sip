package org.valledelbit.sip

class TipoPredio {
	String noTipoPredio
	String descripcionTipoPredio

	static constraints = {
		noTipoPredio maxSize: 10, blank:false
		descripcionTipoPredio maxSize: 100, blank:true
	}
}
