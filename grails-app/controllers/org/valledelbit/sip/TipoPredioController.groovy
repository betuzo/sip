package org.valledelbit.sip

import org.springframework.dao.DataIntegrityViolationException

class TipoPredioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoPredioInstanceList: TipoPredio.list(params), tipoPredioInstanceTotal: TipoPredio.count()]
    }

    def create() {
        [tipoPredioInstance: new TipoPredio(params)]
    }

    def save() {
        def tipoPredioInstance = new TipoPredio(params)
        if (!tipoPredioInstance.save(flush: true)) {
            render(view: "create", model: [tipoPredioInstance: tipoPredioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tipoPredio.label', default: 'TipoPredio'), tipoPredioInstance.id])
        redirect(action: "show", id: tipoPredioInstance.id)
    }

    def show() {
        def tipoPredioInstance = TipoPredio.get(params.id)
        if (!tipoPredioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPredio.label', default: 'TipoPredio'), params.id])
            redirect(action: "list")
            return
        }

        [tipoPredioInstance: tipoPredioInstance]
    }

    def edit() {
        def tipoPredioInstance = TipoPredio.get(params.id)
        if (!tipoPredioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPredio.label', default: 'TipoPredio'), params.id])
            redirect(action: "list")
            return
        }

        [tipoPredioInstance: tipoPredioInstance]
    }

    def update() {
        def tipoPredioInstance = TipoPredio.get(params.id)
        if (!tipoPredioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPredio.label', default: 'TipoPredio'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tipoPredioInstance.version > version) {
                tipoPredioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoPredio.label', default: 'TipoPredio')] as Object[],
                          "Another user has updated this TipoPredio while you were editing")
                render(view: "edit", model: [tipoPredioInstance: tipoPredioInstance])
                return
            }
        }

        tipoPredioInstance.properties = params

        if (!tipoPredioInstance.save(flush: true)) {
            render(view: "edit", model: [tipoPredioInstance: tipoPredioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoPredio.label', default: 'TipoPredio'), tipoPredioInstance.id])
        redirect(action: "show", id: tipoPredioInstance.id)
    }

    def delete() {
        def tipoPredioInstance = TipoPredio.get(params.id)
        if (!tipoPredioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPredio.label', default: 'TipoPredio'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tipoPredioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoPredio.label', default: 'TipoPredio'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoPredio.label', default: 'TipoPredio'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
