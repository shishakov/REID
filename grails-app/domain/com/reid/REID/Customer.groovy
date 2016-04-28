package com.reid.REID

class Customer {

    String firstname
    String lastname
    Integer age
    String emailAddress


    static constraints = {
        firstname(blank: false,maxSize: 50)
        lastname(blank: false,maxSize: 50)
        age(nullable: true)
        emailAddress(nullable: true)
    }
}
