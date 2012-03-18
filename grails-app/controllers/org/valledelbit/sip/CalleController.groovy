package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class CalleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [calleInstanceList: Calle.list(params), calleInstanceTotal: Calle.count()]
    }

    def create() {
        [calleInstance: new Calle(params)]
    }

    def save() {
        def calleInstance = new Calle(params)
        if (!calleInstance.save(flush: true)) {
            render(view: "create", model: [calleInstance: calleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'calle.label', default: 'Calle'), calleInstance.id])
        redirect(action: "show", id: calleInstance.id)
    }

    def show() {
        def calleInstance = Calle.get(params.id)
        if (!calleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'calle.label', default: 'Calle'), params.id])
            redirect(action: "list")
            return
        }

        [calleInstance: calleInstance]
    }

    def edit() {
        def calleInstance = Calle.get(params.id)
        if (!calleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calle.label', default: 'Calle'), params.id])
            redirect(action: "list")
            return
        }

        [calleInstance: calleInstance]
    }

    def update() {
        def calleInstance = Calle.get(params.id)
        if (!calleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calle.label', default: 'Calle'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (calleInstance.version > version) {
                calleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'calle.label', default: 'Calle')] as Object[],
                          "Another user has updated this Calle while you were editing")
                render(view: "edit", model: [calleInstance: calleInstance])
                return
            }
        }

        calleInstance.properties = params

        if (!calleInstance.save(flush: true)) {
            render(view: "edit", model: [calleInstance: calleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'calle.label', default: 'Calle'), calleInstance.id])
        redirect(action: "show", id: calleInstance.id)
    }

    def delete() {
        def calleInstance = Calle.get(params.id)
        if (!calleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'calle.label', default: 'Calle'), params.id])
            redirect(action: "list")
            return
        }

        try {
            calleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'calle.label', default: 'Calle'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'calle.label', default: 'Calle'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
