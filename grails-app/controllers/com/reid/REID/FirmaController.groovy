package com.reid.REID

import grails.plugin.springsecurity.annotation.Secured

import java.security.MessageDigest

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['permitAll'])
@Transactional(readOnly = true)
class FirmaController {

    static scaffold = Firma

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Firma.list(params), model: [firmaInstanceCount: Firma.count()]
    }

    def show(Firma firmaInstance) {
        respond firmaInstance
    }

    def create() {
        respond new Firma(params)
    }

    def upload() {
    }

    @Transactional
    def doUpload(Firma firmaInstance) {
        def file = request.getFile('file')

        def allLines = file.inputStream.toCsvReader().readAll()

        def list = allLines.collect {it}
        def cl= list.size()







        for (int r = 0; r < cl; r++){
            String rows =list[r][0]+list[r][1] + list[r][2] + list[r][3]
            def rowsHash = MessageDigest.getInstance("MD5").digest(rows.bytes).encodeHex().toString()
            def firm = new Firma (
                    name_firm: list[r][0],
                    e_mail:list[r][1],
                    addressS: list[r][2],
                    indexX: list[r][3],
                    lantitudeS: list[r][3],
                    longitudeD: list[r][3],
                    hash_record: rowsHash)
            def user = User.get(1)
            firm.user = user
            firm.save(flush: true)
        }
        redirect (action:'list')
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Firma.label', default: 'Firma'), firmaInstance.id])
                redirect firmaInstance
            }
            '*' { respond firmaInstance, [status: OK] }
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
