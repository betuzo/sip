package org.valledelbit.sip

class PredioValor {
	String noPredioValor
	Date año
	Double valorFiscal
	Double valorCatastral
	Double valorComercial


    static constraints = {
		noPredioValor maxSize: 10, blank: false
		año max: new Date(), blank: false
		valorFiscal maxSize: 25, blank: false
		valorCatastral maxSize: 25, blank: false
		valorComercial maxSize: 25, blank: false
    }
}
