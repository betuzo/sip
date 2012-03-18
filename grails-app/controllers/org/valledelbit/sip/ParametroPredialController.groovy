package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class ParametroPredialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [parametroPredialInstanceList: ParametroPredial.list(params), parametroPredialInstanceTotal: ParametroPredial.count()]
    }

    def create() {
        [parametroPredialInstance: new ParametroPredial(params)]
    }

    def save() {
        def parametroPredialInstance = new ParametroPredial(params)
        if (!parametroPredialInstance.save(flush: true)) {
            render(view: "create", model: [parametroPredialInstance: parametroPredialInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'parametroPredial.label', default: 'ParametroPredial'), parametroPredialInstance.id])
        redirect(action: "show", id: parametroPredialInstance.id)
    }

    def show() {
        def parametroPredialInstance = ParametroPredial.get(params.id)
        if (!parametroPredialInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'parametroPredial.label', default: 'ParametroPredial'), params.id])
            redirect(action: "list")
            return
        }

        [parametroPredialInstance: parametroPredialInstance]
    }

    def edit() {
        def parametroPredialInstance = ParametroPredial.get(params.id)
        if (!parametroPredialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parametroPredial.label', default: 'ParametroPredial'), params.id])
            redirect(action: "list")
            return
        }

        [parametroPredialInstance: parametroPredialInstance]
    }

    def update() {
        def parametroPredialInstance = ParametroPredial.get(params.id)
        if (!parametroPredialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parametroPredial.label', default: 'ParametroPredial'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (parametroPredialInstance.version > version) {
                parametroPredialInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'parametroPredial.label', default: 'ParametroPredial')] as Object[],
                          "Another user has updated this ParametroPredial while you were editing")
                render(view: "edit", model: [parametroPredialInstance: parametroPredialInstance])
                return
            }
        }

        parametroPredialInstance.properties = params

        if (!parametroPredialInstance.save(flush: true)) {
            render(view: "edit", model: [parametroPredialInstance: parametroPredialInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'parametroPredial.label', default: 'ParametroPredial'), parametroPredialInstance.id])
        redirect(action: "show", id: parametroPredialInstance.id)
    }

    def delete() {
        def parametroPredialInstance = ParametroPredial.get(params.id)
        if (!parametroPredialInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'parametroPredial.label', default: 'ParametroPredial'), params.id])
            redirect(action: "list")
            return
        }

        try {
            parametroPredialInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'parametroPredial.label', default: 'ParametroPredial'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'parametroPredial.label', default: 'ParametroPredial'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
