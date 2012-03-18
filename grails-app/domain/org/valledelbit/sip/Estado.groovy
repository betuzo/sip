package org.valledelbit.sip

class Estado {
	String noEstado
	String estado

	String toString() {
		return "$noEstado - $estado"
	}

	static constraints = {
		noEstado maxSize: 25, blank:false
		estado maxSize: 50, blank:false
	}
}