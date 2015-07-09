package org.rescate

class AnimalEvent implements Comparable {

    static belongsTo = [animal:Animal]
    //static transients = [ 'deleted' ]

    //Long AnimalEventId
    String eventType
    Date eventDate
    String comments
    boolean deleted


    static constraints = {
        eventType (inList: ["nacimiento", "adopcion", "castracion", "transito"])
    //    eventDate (blank: false)
    //    comments (blank: false)
    }
	
	
	int compareTo(Object other) {
		//eventType <=> other.eventType ?: eventDate <=> other.eventDate ?: comments <=> other.comments
		eventType <=> other.eventType
	}
}
