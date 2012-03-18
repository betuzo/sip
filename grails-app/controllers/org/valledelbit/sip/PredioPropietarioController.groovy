package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class PredioPropietarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [predioPropietarioInstanceList: PredioPropietario.list(params), predioPropietarioInstanceTotal: PredioPropietario.count()]
    }

    def create() {
        [predioPropietarioInstance: new PredioPropietario(params)]
    }

    def save() {
        def predioPropietarioInstance = new PredioPropietario(params)
        if (!predioPropietarioInstance.save(flush: true)) {
            render(view: "create", model: [predioPropietarioInstance: predioPropietarioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'predioPropietario.label', default: 'PredioPropietario'), predioPropietarioInstance.id])
        redirect(action: "show", id: predioPropietarioInstance.id)
    }

    def show() {
        def predioPropietarioInstance = PredioPropietario.get(params.id)
        if (!predioPropietarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'predioPropietario.label', default: 'PredioPropietario'), params.id])
            redirect(action: "list")
            return
        }

        [predioPropietarioInstance: predioPropietarioInstance]
    }

    def edit() {
        def predioPropietarioInstance = PredioPropietario.get(params.id)
        if (!predioPropietarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predioPropietario.label', default: 'PredioPropietario'), params.id])
            redirect(action: "list")
            return
        }

        [predioPropietarioInstance: predioPropietarioInstance]
    }

    def update() {
        def predioPropietarioInstance = PredioPropietario.get(params.id)
        if (!predioPropietarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predioPropietario.label', default: 'PredioPropietario'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (predioPropietarioInstance.version > version) {
                predioPropietarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'predioPropietario.label', default: 'PredioPropietario')] as Object[],
                          "Another user has updated this PredioPropietario while you were editing")
                render(view: "edit", model: [predioPropietarioInstance: predioPropietarioInstance])
                return
            }
        }

        predioPropietarioInstance.properties = params

        if (!predioPropietarioInstance.save(flush: true)) {
            render(view: "edit", model: [predioPropietarioInstance: predioPropietarioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'predioPropietario.label', default: 'PredioPropietario'), predioPropietarioInstance.id])
        redirect(action: "show", id: predioPropietarioInstance.id)
    }

    def delete() {
        def predioPropietarioInstance = PredioPropietario.get(params.id)
        if (!predioPropietarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'predioPropietario.label', default: 'PredioPropietario'), params.id])
            redirect(action: "list")
            return
        }

        try {
            predioPropietarioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'predioPropietario.label', default: 'PredioPropietario'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'predioPropietario.label', default: 'PredioPropietario'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
