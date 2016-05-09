package com.reid.REID

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@ToString(cache = true, includeNames = true, includePackage = false)
class Firma implements Serializable  {

    static searchable = true

    String name_firm
    String e_mail
    String addressS
    String indexX
    String lantitudeS
    String longitudeD
    String hash_record

    static belongsTo = [user: User]

    static constraints = {
        name_firm blank: false
        e_mail blank: false, unique: true
        addressS blank: false
        indexX blank: false
        lantitudeS blank: false
        longitudeD blank: false
        hash_record blank: false
        user nullable: true
    }

    static mapping = {
        cache true
    }


}
