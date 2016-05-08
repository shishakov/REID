package com.reid.REID


import grails.plugin.geocode.Point
import grails.plugin.springsecurity.annotation.Secured

import java.security.MessageDigest

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_USER'])
@Transactional(readOnly = true)

class FirmaController {

    static scaffold = Firma

    GeocodingService geocodingService

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

    def getHashCode(String str) {
        def rowsHash = MessageDigest.getInstance("MD5").digest(str.bytes).encodeHex().toString()
        return rowsHash
    }

    @Transactional
    def doUpload() {
        def file = request.getFile('file')
        def allLines = file.inputStream.toCsvReader().readAll()
        def list = allLines.collect { it }
        for (int r = 0; r < list.size(); r++) {
            String rows = list[r][0] + list[r][1] + list[r][2] + list[r][3]
            def firmDB = Firma.findByE_mail(list[r][1])
            if (firmDB) {
                String hashRows = firmDB.name_firm + firmDB.getE_mail() + firmDB.addressS + firmDB.indexX
                def rowsHash = getHashCode(rows)
                if (rowsHash != getHashCode(hashRows)) {
                    List<Point> locations = geocodingService.getPoints(list[r][2])
                    firmDB.name_firm = list[r][0]
                    firmDB.addressS = list[r][2]
                    firmDB.indexX = list[r][3]
                    firmDB.lantitudeS = locations[0].getLatitude().toString()
                    firmDB.longitudeD = locations[0].getLongitude().toString()
                    firmDB.hash_record = rowsHash
                    def user = User.get(1)
                    firmDB.user = user
                    firmDB.save(flush: true)
                }
            } else {
                def rowsHash = getHashCode(rows)
                List<Point> locations = geocodingService.getPoints(list[r][2])
                def firm = new Firma(
                        name_firm: list[r][0],
                        e_mail: list[r][1],
                        addressS: list[r][2],
                        indexX: list[r][3],
                        lantitudeS: locations[0].getLatitude().toString(),
                        longitudeD: locations[0].getLongitude().toString(),
                        hash_record: rowsHash)
                def user = User.get(1)
                firm.user = user
                firm.save(flush: true)
            }
        }

        //GEO

        //def validAddress = 'ulica Nekrasova 10, Minsk, Minsk Region, Belarus';

//        List<Point> locations = geocodingService.getPoints(list[0][2])
//        locations[0].latitude
//        locations[0].longitude

// return geo
//        Point location = new Point(latitude: 53.931686, longitude: 27.595127)
//        def results = geocodingService.getAddresses(location)
//        println results.size() > 1
//
//        // limit the number of results returned
//        def limit = 1
//        results = service.getAddresses(location, [max: limit])
//        assertEquals limit, results.size()

        // request just a single address
//        def address = geocodingService.getAddress(location)
//        println address

        redirect(action: 'list')
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
        println firmaInstance
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
