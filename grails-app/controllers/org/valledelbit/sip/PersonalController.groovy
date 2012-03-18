package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class PersonalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personalInstanceList: Personal.list(params), personalInstanceTotal: Personal.count()]
    }

    def create() {
        [personalInstance: new Personal(params)]
    }

    def save() {
        def personalInstance = new Personal(params)
        if (!personalInstance.save(flush: true)) {
            render(view: "create", model: [personalInstance: personalInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'personal.label', default: 'Personal'), personalInstance.id])
        redirect(action: "show", id: personalInstance.id)
    }

    def show() {
        def personalInstance = Personal.get(params.id)
        if (!personalInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'personal.label', default: 'Personal'), params.id])
            redirect(action: "list")
            return
        }

        [personalInstance: personalInstance]
    }

    def edit() {
        def personalInstance = Personal.get(params.id)
        if (!personalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personal.label', default: 'Personal'), params.id])
            redirect(action: "list")
            return
        }

        [personalInstance: personalInstance]
    }

    def update() {
        def personalInstance = Personal.get(params.id)
        if (!personalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'personal.label', default: 'Personal'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (personalInstance.version > version) {
                personalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'personal.label', default: 'Personal')] as Object[],
                          "Another user has updated this Personal while you were editing")
                render(view: "edit", model: [personalInstance: personalInstance])
                return
            }
        }

        personalInstance.properties = params

        if (!personalInstance.save(flush: true)) {
            render(view: "edit", model: [personalInstance: personalInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'personal.label', default: 'Personal'), personalInstance.id])
        redirect(action: "show", id: personalInstance.id)
    }

    def delete() {
        def personalInstance = Personal.get(params.id)
        if (!personalInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'personal.label', default: 'Personal'), params.id])
            redirect(action: "list")
            return
        }

        try {
            personalInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'personal.label', default: 'Personal'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'personal.label', default: 'Personal'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
