package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class HabitanteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [habitanteInstanceList: Habitante.list(params), habitanteInstanceTotal: Habitante.count()]
    }

    def create() {
        [habitanteInstance: new Habitante(params)]
    }

    def save() {
        def habitanteInstance = new Habitante(params)
        if (!habitanteInstance.save(flush: true)) {
            render(view: "create", model: [habitanteInstance: habitanteInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'habitante.label', default: 'Habitante'), habitanteInstance.id])
        redirect(action: "show", id: habitanteInstance.id)
    }

    def show() {
        def habitanteInstance = Habitante.get(params.id)
        if (!habitanteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'habitante.label', default: 'Habitante'), params.id])
            redirect(action: "list")
            return
        }

        [habitanteInstance: habitanteInstance]
    }

    def edit() {
        def habitanteInstance = Habitante.get(params.id)
        if (!habitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'habitante.label', default: 'Habitante'), params.id])
            redirect(action: "list")
            return
        }

        [habitanteInstance: habitanteInstance]
    }

    def update() {
        def habitanteInstance = Habitante.get(params.id)
        if (!habitanteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'habitante.label', default: 'Habitante'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (habitanteInstance.version > version) {
                habitanteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'habitante.label', default: 'Habitante')] as Object[],
                          "Another user has updated this Habitante while you were editing")
                render(view: "edit", model: [habitanteInstance: habitanteInstance])
                return
            }
        }

        habitanteInstance.properties = params

        if (!habitanteInstance.save(flush: true)) {
            render(view: "edit", model: [habitanteInstance: habitanteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'habitante.label', default: 'Habitante'), habitanteInstance.id])
        redirect(action: "show", id: habitanteInstance.id)
    }

    def delete() {
        def habitanteInstance = Habitante.get(params.id)
        if (!habitanteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'habitante.label', default: 'Habitante'), params.id])
            redirect(action: "list")
            return
        }

        try {
            habitanteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'habitante.label', default: 'Habitante'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'habitante.label', default: 'Habitante'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
