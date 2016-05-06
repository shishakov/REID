package com.reid.REID

import groovy.transform.Immutable

@Immutable
class Address {
    List<AddressComponent> addressComponents
    String formattedAddress
    List<String> types
    Geometry geometry
}
