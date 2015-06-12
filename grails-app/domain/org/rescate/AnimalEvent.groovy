package org.rescate

class AnimalEvent {

    static belongsTo = [animal: Animal]

    String eventType
    Date eventDate
    String comments

    static constraints = {
        eventType (inList: ["nacimiento", "adopcion", "castracion", "transito"])
        eventDate (blank: false)
        comments (blank: false)
    }
}
