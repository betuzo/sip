package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class PuestoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [puestoInstanceList: Puesto.list(params), puestoInstanceTotal: Puesto.count()]
    }

    def create() {
        [puestoInstance: new Puesto(params)]
    }

    def save() {
        def puestoInstance = new Puesto(params)
        if (!puestoInstance.save(flush: true)) {
            render(view: "create", model: [puestoInstance: puestoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'puesto.label', default: 'Puesto'), puestoInstance.id])
        redirect(action: "show", id: puestoInstance.id)
    }

    def show() {
        def puestoInstance = Puesto.get(params.id)
        if (!puestoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'puesto.label', default: 'Puesto'), params.id])
            redirect(action: "list")
            return
        }

        [puestoInstance: puestoInstance]
    }

    def edit() {
        def puestoInstance = Puesto.get(params.id)
        if (!puestoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'puesto.label', default: 'Puesto'), params.id])
            redirect(action: "list")
            return
        }

        [puestoInstance: puestoInstance]
    }

    def update() {
        def puestoInstance = Puesto.get(params.id)
        if (!puestoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'puesto.label', default: 'Puesto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (puestoInstance.version > version) {
                puestoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'puesto.label', default: 'Puesto')] as Object[],
                          "Another user has updated this Puesto while you were editing")
                render(view: "edit", model: [puestoInstance: puestoInstance])
                return
            }
        }

        puestoInstance.properties = params

        if (!puestoInstance.save(flush: true)) {
            render(view: "edit", model: [puestoInstance: puestoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'puesto.label', default: 'Puesto'), puestoInstance.id])
        redirect(action: "show", id: puestoInstance.id)
    }

    def delete() {
        def puestoInstance = Puesto.get(params.id)
        if (!puestoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'puesto.label', default: 'Puesto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            puestoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'puesto.label', default: 'Puesto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'puesto.label', default: 'Puesto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
