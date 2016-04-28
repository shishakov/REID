package com.reid.REID

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['permitAll'])
@Transactional(readOnly = true)
class FirmaController {

    static scaffold = Firma

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Firma.list(params), model: [firmaInstanceCount: Firma.count()]
    }

    def show(Firma firmaInstance) {
        respond firmaInstance
    }

    def create() {
        respond new Firma(params)
    }

    @Transactional
    def save(Firma firmaInstance) {
        if (firmaInstance == null) {
            notFound()
            return
        }

        if (firmaInstance.hasErrors()) {
            respond firmaInstance.errors, view: 'create'
            return
        }

        firmaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'firma.label', default: 'Firma'), firmaInstance.id])
                redirect firmaInstance
            }
            '*' { respond firmaInstance, [status: CREATED] }
        }
    }

    def edit(Firma firmaInstance) {
        respond firmaInstance
    }

    @Transactional
    def update(Firma firmaInstance) {
        if (firmaInstance == null) {
            notFound()
            return
        }

        if (firmaInstance.hasErrors()) {
            respond firmaInstance.errors, view: 'edit'
            return
        }

        firmaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Firma.label', default: 'Firma'), firmaInstance.id])
                redirect firmaInstance
            }
            '*' { respond firmaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Firma firmaInstance) {

        if (firmaInstance == null) {
            notFound()
            return
        }

        firmaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Firma.label', default: 'Firma'), firmaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'firma.label', default: 'Firma'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
