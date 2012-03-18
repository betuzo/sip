package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class PagosPredioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pagosPredioInstanceList: PagosPredio.list(params), pagosPredioInstanceTotal: PagosPredio.count()]
    }

    def create() {
        [pagosPredioInstance: new PagosPredio(params)]
    }

    def save() {
        def pagosPredioInstance = new PagosPredio(params)
        if (!pagosPredioInstance.save(flush: true)) {
            render(view: "create", model: [pagosPredioInstance: pagosPredioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'pagosPredio.label', default: 'PagosPredio'), pagosPredioInstance.id])
        redirect(action: "show", id: pagosPredioInstance.id)
    }

    def show() {
        def pagosPredioInstance = PagosPredio.get(params.id)
        if (!pagosPredioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagosPredio.label', default: 'PagosPredio'), params.id])
            redirect(action: "list")
            return
        }

        [pagosPredioInstance: pagosPredioInstance]
    }

    def edit() {
        def pagosPredioInstance = PagosPredio.get(params.id)
        if (!pagosPredioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagosPredio.label', default: 'PagosPredio'), params.id])
            redirect(action: "list")
            return
        }

        [pagosPredioInstance: pagosPredioInstance]
    }

    def update() {
        def pagosPredioInstance = PagosPredio.get(params.id)
        if (!pagosPredioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagosPredio.label', default: 'PagosPredio'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pagosPredioInstance.version > version) {
                pagosPredioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pagosPredio.label', default: 'PagosPredio')] as Object[],
                          "Another user has updated this PagosPredio while you were editing")
                render(view: "edit", model: [pagosPredioInstance: pagosPredioInstance])
                return
            }
        }

        pagosPredioInstance.properties = params

        if (!pagosPredioInstance.save(flush: true)) {
            render(view: "edit", model: [pagosPredioInstance: pagosPredioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'pagosPredio.label', default: 'PagosPredio'), pagosPredioInstance.id])
        redirect(action: "show", id: pagosPredioInstance.id)
    }

    def delete() {
        def pagosPredioInstance = PagosPredio.get(params.id)
        if (!pagosPredioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagosPredio.label', default: 'PagosPredio'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pagosPredioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pagosPredio.label', default: 'PagosPredio'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pagosPredio.label', default: 'PagosPredio'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
