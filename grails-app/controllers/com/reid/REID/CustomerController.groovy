package com.reid.REID

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*

@Secured(['IS_AUTHENTICATED_FULLY'])
@Transactional(readOnly = true)
class CustomerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max'):10,100)
        [customerInstanceList: Customer.list(params), customerInstanceTotal: Customer.count()]
    }

    //return JSON list of customers
    def jg_customer_list = {
        def sortIndex = params.sidx ?: 'lastname'
        def sortOrder = params.sord ?: 'asc'

        def maxRows = Integer.valueOf(params.rows)
        def currentPage = Integer.valueOf(params.page) ?:1
        def rowOffset = currentPage == 1 ? 0 : (currentPage - 1) * maxRows

        def customers = Customer.createCriteria().list(max: maxRows, offset: rowOffset) {

            //first name case insensitive where the field begins with the search term
            if (params.firstName)
                ilike('firstName', params.firstName + '%')

            //last name case insensitive where the field begins with the search term
            if (params.lastName)
                ilike('lastName', params.lastName + '%')

            //age search where the age Equals the search term
            if (params.age)
                eq('age', Integer.valueOf(params.age))

            //email case insensitive where the field begins with the search term
            if (params.emailAddress)
                ilike('emailAddress', params.emailAddress + '%')

            // set the order and direction
            order(sortIndex, sortOrder).ignoreCase()
        }
        def totalRows = customers.totalCount
        def numberOfPages = Math.ceil(totalRows / maxRows)

        def jsonCells = customers.collect {
            [cell: [it.firstname,
                    it.lastname,
                    it.age,
                    it.emailAddress
            ], id: it.id]
        }
        def jsonData = [rows: jsonCells, page: currentPage, records: totalRows, total: numberOfPages]
        render jsonData as JSON
    }

    def jq_edit_customer = {
        def customer = null;
        def message = ""
        def state ="FAIL"
        def id

        //determine our action
        switch (params.oper){
            // add instruction sent
            case 'add':
                customer = new Customer(params)
                if (! customer.hasErrors() && customer.save()) {
                    message = "Customer ${customer.firstname} ${customer.lastname} Added"
                    id = customer.id
                    state = "OK"
                }else{
                    message = "Could Not Save Customer"
                }
                break
            case 'del':
                //check customer exists
            customer = Customer.get(params.id)
                if(customer){
                    //delete customer
                    customer.delete()
                    message = "Customer ${customer.firstname} ${customer.lastname} Deleted"
                    state = "OK"
                }
                break
            default:
                // default edit action
            //first retrive the customer by its ID
            customer = Customer.get(params.id)
                if(customer) {
                    // set the properties according to passed in parameters
                    customer.properties = params
                    if(! customer.hasErrors() && customer.save()){
                        message = "Customer ${customer.firstname} ${customer.lastname} Updated"
                        id= customer.id
                        state = "OK"
                    }else{
                        message = "Could not Update Customer"
                    }
                }
                break


        }

        def response = [message: message, state: state, id: id]

        render response as JSON
    }
    def show(Customer customerInstance) {
        respond customerInstance
    }

    def create() {
        respond new Customer(params)
    }

    @Transactional
    def save(Customer customerInstance) {
        if (customerInstance == null) {
            notFound()
            return
        }

        if (customerInstance.hasErrors()) {
            respond customerInstance.errors, view: 'create'
            return
        }

        customerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
                redirect customerInstance
            }
            '*' { respond customerInstance, [status: CREATED] }
        }
    }

    def edit(Customer customerInstance) {
        respond customerInstance
    }

    @Transactional
    def update(Customer customerInstance) {
        if (customerInstance == null) {
            notFound()
            return
        }

        if (customerInstance.hasErrors()) {
            respond customerInstance.errors, view: 'edit'
            return
        }

        customerInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])
                redirect customerInstance
            }
            '*' { respond customerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Customer customerInstance) {

        if (customerInstance == null) {
            notFound()
            return
        }

        customerInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Simple.label', default: 'Simple'), simpleInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Simple'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
