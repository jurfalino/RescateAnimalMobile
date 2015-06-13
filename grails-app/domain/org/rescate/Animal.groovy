package org.rescate
class Animal {
    String nombre
    String especie
    String color
    String pelo
    String raza
    // Mappings
    static hasMany = [
            imagenes : Imagen,
            eventos : AnimalEvent
    ]

    //byte[] img_avatar
    //String avatarType
    Date dateOfBirth
    Date dateOfIntake
    Date dateNeutered
    static constraints = {
        nombre (blank: false)
        especie (inList: ["Gato", "Perro", "Conejo"])
        color (inList: ["Blanco", "Negro", "Naranja", "Gris", "Blanco y Negro", "Tricolor", "Barsino", "Carey"])
        pelo (inList: ["Corto", "Largo"])
        raza (inList: ["Comun", "Siames", "Persa", "Otro"])
        dateOfBirth (blank: false)
        dateOfIntake (blank: false)
        dateNeutered (blank: false)

        //img_avatar (nullable:true, maxSize: 16384 /* 16K */)
        //avatarType (nullable:true)
        eventos (nullable:true)
    }
}