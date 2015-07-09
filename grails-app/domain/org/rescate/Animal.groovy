package org.rescate

import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;

class Animal {
    //Long AnimalId
    Long id
    String nombre
    String especie
    String color
    String pelo
    String raza

    // Mappings
    //SortedSet imagenes
    //ArrayList eventos //= LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(AnimalEvent.class))
	//List eventos = [].withLazyDefault {new AnimalEvent()}
    static hasMany = [
            imagenes : Imagen,
            eventos : AnimalEvent
    ]
    static mapping = {
        eventos cascade:"all-delete-orphan" //asegura que se borren los eventos si borro el animal
        //id composite: ["AnimalId", "AnimalEventId"]
    }
    //byte[] img_avatar
    //String avatarType
    String edad
    Date dateOfIntake
    Date dateNeutered
    static constraints = {
        nombre (blank: false)
        especie (inList: ["Gato", "Perro", "Conejo"])
        color (inList: ["Blanco", "Negro", "Naranja", "Gris", "Blanco y Negro", "Tricolor", "Barsino", "Carey"])
        pelo (inList: ["Corto", "Largo"])
        raza (inList: ["Comun", "Siames", "Persa", "Otro"])
		edad (inList: ["<= 1 mes", "2 meses", "3 meses", "4 meses", "5 meses", "6 meses", "7 meses", "8 a 12 meses", "1 a�o", "2 a�os", "3 a�o", "4 a�os", "5-6 a�os", ">7 a�os"])
        //dateOfIntake (blank: false)
        //dateNeutered (blank: false)

        //img_avatar (nullable:true, maxSize: 16384 /* 16K */)
        //avatarType (nullable:true)
        eventos (nullable:true)
    }
	
	def getEventosList() {
		return LazyList.decorate(
			  eventos,
			  FactoryUtils.instantiateFactory(AnimalEvent.class))
	}
}