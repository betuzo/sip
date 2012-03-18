package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class PredioValorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [predioValorInstanceList: PredioValor.list(params), predioValorInstanceTotal: PredioValor.count()]
    }

    def create() {
        [predioValorInstance: new PredioValor(params)]
    }

    def save() {
        def predioValorInstance = new PredioValor(params)
        if (!predioValorInstance.save(flush: true)) {
            render(view: "create", model: [predioValorInstance: predioValorInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'predioValor.label', default: 'PredioValor'), predioValorInstance.id])
        redirect(action: "show", id: predioValorInstance.id)
    }

    def show() {
        def predioValorInstance = PredioValor.get(params.id)
        if (!predioValorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'predioValor.label', default: 'PredioValor'), params.id])
            redirect(action: "list")
            return
        }

        [predioValorInstance: predioValorInstance]
    }

    def edit() {
        def predioValorInstance = PredioValor.get(params.id)
        if (!predioValorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predioValor.label', default: 'PredioValor'), params.id])
            redirect(action: "list")
            return
        }

        [predioValorInstance: predioValorInstance]
    }

    def update() {
        def predioValorInstance = PredioValor.get(params.id)
        if (!predioValorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predioValor.label', default: 'PredioValor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (predioValorInstance.version > version) {
                predioValorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'predioValor.label', default: 'PredioValor')] as Object[],
                          "Another user has updated this PredioValor while you were editing")
                render(view: "edit", model: [predioValorInstance: predioValorInstance])
                return
            }
        }

        predioValorInstance.properties = params

        if (!predioValorInstance.save(flush: true)) {
            render(view: "edit", model: [predioValorInstance: predioValorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'predioValor.label', default: 'PredioValor'), predioValorInstance.id])
        redirect(action: "show", id: predioValorInstance.id)
    }

    def delete() {
        def predioValorInstance = PredioValor.get(params.id)
        if (!predioValorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'predioValor.label', default: 'PredioValor'), params.id])
            redirect(action: "list")
            return
        }

        try {
            predioValorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'predioValor.label', default: 'PredioValor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'predioValor.label', default: 'PredioValor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
