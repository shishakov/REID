package com.reid.REID

import groovy.transform.Immutable

@Immutable
class AddressComponent {
    String longName
    String shortName
    List<String> types
}