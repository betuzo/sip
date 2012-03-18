package org.valledelbit.sip

class Concepto {
	String noCocepto
	String descripcionConcepto
	String noCuentaNOI
	Dependencia dependencia
	String precio

	String toString() {
		return "$noCocepto - $descripcionConcepto"
	}

	static constraints = {
		noCocepto maxSize: 10, blank:false
		descripcionConcepto maxSize: 100, blank:true
		noCuentaNOI maxSize: 25, blank:false
		dependencia blank:false
		precio maxSize: 25, blank:false
	}
}
