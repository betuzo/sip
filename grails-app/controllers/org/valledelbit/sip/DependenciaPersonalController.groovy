package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class DependenciaPersonalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dependenciaPersonalInstanceList: DependenciaPersonal.list(params), dependenciaPersonalInstanceTotal: DependenciaPersonal.count()]
    }

    def create() {
        [dependenciaPersonalInstance: new DependenciaPersonal(params)]
    }

    def save() {
        def dependenciaPersonalInstance = new DependenciaPersonal(params)
        if (!dependenciaPersonalInstance.save(flush: true)) {
            render(view: "create", model: [dependenciaPersonalInstance: dependenciaPersonalInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal'), dependenciaPersonalInstance.id])
        redirect(action: "show", id: dependenciaPersonalInstance.id)
    }

    def show() {
        def dependenciaPersonalInstance = DependenciaPersonal.get(params.id)
        if (!dependenciaPersonalInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal'), params.id])
            redirect(action: "list")
            return
        }

        [dependenciaPersonalInstance: dependenciaPersonalInstance]
    }

    def edit() {
        def dependenciaPersonalInstance = DependenciaPersonal.get(params.id)
        if (!dependenciaPersonalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal'), params.id])
            redirect(action: "list")
            return
        }

        [dependenciaPersonalInstance: dependenciaPersonalInstance]
    }

    def update() {
        def dependenciaPersonalInstance = DependenciaPersonal.get(params.id)
        if (!dependenciaPersonalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (dependenciaPersonalInstance.version > version) {
                dependenciaPersonalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal')] as Object[],
                          "Another user has updated this DependenciaPersonal while you were editing")
                render(view: "edit", model: [dependenciaPersonalInstance: dependenciaPersonalInstance])
                return
            }
        }

        dependenciaPersonalInstance.properties = params

        if (!dependenciaPersonalInstance.save(flush: true)) {
            render(view: "edit", model: [dependenciaPersonalInstance: dependenciaPersonalInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal'), dependenciaPersonalInstance.id])
        redirect(action: "show", id: dependenciaPersonalInstance.id)
    }

    def delete() {
        def dependenciaPersonalInstance = DependenciaPersonal.get(params.id)
        if (!dependenciaPersonalInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal'), params.id])
            redirect(action: "list")
            return
        }

        try {
            dependenciaPersonalInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
