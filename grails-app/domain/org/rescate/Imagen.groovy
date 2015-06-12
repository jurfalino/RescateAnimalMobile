package org.rescate

class Imagen {

    static belongsTo = [animal: Animal]

    byte[] filePayload
    String fileType  //Optional
    String fileName //Optional

    static constraints = {
        filePayload(nullable:true, maxSize:1073741824) // max of 4GB file for example
        fileType(blank:true, nullable:true)
        fileName(blank:true, nullable:true)
    }
}
