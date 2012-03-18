package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class CentroTrabajoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [centroTrabajoInstanceList: CentroTrabajo.list(params), centroTrabajoInstanceTotal: CentroTrabajo.count()]
    }

    def create() {
        [centroTrabajoInstance: new CentroTrabajo(params)]
    }

    def save() {
        def centroTrabajoInstance = new CentroTrabajo(params)
        if (!centroTrabajoInstance.save(flush: true)) {
            render(view: "create", model: [centroTrabajoInstance: centroTrabajoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'centroTrabajo.label', default: 'CentroTrabajo'), centroTrabajoInstance.id])
        redirect(action: "show", id: centroTrabajoInstance.id)
    }

    def show() {
        def centroTrabajoInstance = CentroTrabajo.get(params.id)
        if (!centroTrabajoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'centroTrabajo.label', default: 'CentroTrabajo'), params.id])
            redirect(action: "list")
            return
        }

        [centroTrabajoInstance: centroTrabajoInstance]
    }

    def edit() {
        def centroTrabajoInstance = CentroTrabajo.get(params.id)
        if (!centroTrabajoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'centroTrabajo.label', default: 'CentroTrabajo'), params.id])
            redirect(action: "list")
            return
        }

        [centroTrabajoInstance: centroTrabajoInstance]
    }

    def update() {
        def centroTrabajoInstance = CentroTrabajo.get(params.id)
        if (!centroTrabajoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'centroTrabajo.label', default: 'CentroTrabajo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (centroTrabajoInstance.version > version) {
                centroTrabajoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'centroTrabajo.label', default: 'CentroTrabajo')] as Object[],
                          "Another user has updated this CentroTrabajo while you were editing")
                render(view: "edit", model: [centroTrabajoInstance: centroTrabajoInstance])
                return
            }
        }

        centroTrabajoInstance.properties = params

        if (!centroTrabajoInstance.save(flush: true)) {
            render(view: "edit", model: [centroTrabajoInstance: centroTrabajoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'centroTrabajo.label', default: 'CentroTrabajo'), centroTrabajoInstance.id])
        redirect(action: "show", id: centroTrabajoInstance.id)
    }

    def delete() {
        def centroTrabajoInstance = CentroTrabajo.get(params.id)
        if (!centroTrabajoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'centroTrabajo.label', default: 'CentroTrabajo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            centroTrabajoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'centroTrabajo.label', default: 'CentroTrabajo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'centroTrabajo.label', default: 'CentroTrabajo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
