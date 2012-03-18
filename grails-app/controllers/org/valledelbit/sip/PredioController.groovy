package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class PredioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [predioInstanceList: Predio.list(params), predioInstanceTotal: Predio.count()]
    }

    def create() {
        [predioInstance: new Predio(params)]
    }

    def save() {
        def predioInstance = new Predio(params)
        if (!predioInstance.save(flush: true)) {
            render(view: "create", model: [predioInstance: predioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'predio.label', default: 'Predio'), predioInstance.id])
        redirect(action: "show", id: predioInstance.id)
    }

    def show() {
        def predioInstance = Predio.get(params.id)
        if (!predioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'predio.label', default: 'Predio'), params.id])
            redirect(action: "list")
            return
        }

        [predioInstance: predioInstance]
    }

    def edit() {
        def predioInstance = Predio.get(params.id)
        if (!predioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predio.label', default: 'Predio'), params.id])
            redirect(action: "list")
            return
        }

        [predioInstance: predioInstance]
    }

    def update() {
        def predioInstance = Predio.get(params.id)
        if (!predioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'predio.label', default: 'Predio'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (predioInstance.version > version) {
                predioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'predio.label', default: 'Predio')] as Object[],
                          "Another user has updated this Predio while you were editing")
                render(view: "edit", model: [predioInstance: predioInstance])
                return
            }
        }

        predioInstance.properties = params

        if (!predioInstance.save(flush: true)) {
            render(view: "edit", model: [predioInstance: predioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'predio.label', default: 'Predio'), predioInstance.id])
        redirect(action: "show", id: predioInstance.id)
    }

    def delete() {
        def predioInstance = Predio.get(params.id)
        if (!predioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'predio.label', default: 'Predio'), params.id])
            redirect(action: "list")
            return
        }

        try {
            predioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'predio.label', default: 'Predio'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'predio.label', default: 'Predio'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
