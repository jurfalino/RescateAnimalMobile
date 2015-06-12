package org.rescate

class Adoptante {
    String firstname
    String lastname
    String documentNum
    String documentType
    String mobilePhone
    String facebook
    String email

    //--Address--
    String street
    String zip
    String state
    String country
    String houseType
    String housePhone

    String otherPets

    //--SearchingFor--
    String especie
    String color
    String edad
    String castrado

    static constraints = {
        firstname (blank: false)
        lastname (blank: false)
        documentNum (blank: false)
        documentType (inList: ["DNI"])
        //mobilePhone
        facebook (url: true)
        email email: true

        //Address
        //street
        //zip
        //state
        //country
        houseType (inList: ["Casa", "PH", "Dto"])
        //housePhone

        //--SearchingFor--
        importFrom Animal, include: ["color", "especie", "pelo", "raza"]
        //edad
        castrado (inList: ["si", "no"])
    }
}
