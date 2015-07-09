package org.rescate

import grails.transaction.Transactional

//Animal
//-create
//-update
//-createEvent
//-updateEevent
//-createPhoto
//
//Adoptante
//-create
//-update

@Transactional
class AnimalService {

    boolean transactional = false

    def list(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["Animal"] ]
            return result
        }

        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        result.animalInstanceList = Animal.list(params)
        result.animalInstanceTotal = Animal.count()

        if(!result.animalInstanceList || !result.animalInstanceTotal)
            return fail(code:"default.list.failure")

        // Success.
        return result
    }

    def show(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["Animal", params.id] ]
            return result
        }

        result.animalInstance = Animal.get(params.id)

        if(!result.animalInstance)
            return fail(code:"default.not.found")

        // Success.
        return result
    }

    def delete(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["Animal", params.id] ]
            return result
        }

        result.animalInstance = Animal.get(params.id)

        if(!result.animalInstance)
            return fail(code:"default.not.found")

        try {
            result.animalInstance.delete(flush:true)
            return result //Success.
        }
        catch(org.springframework.dao.DataIntegrityViolationException e) {
            return fail(code:"default.delete.failure")
        }

    }

    def edit(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["Animal", params.id] ]
            return result
        }

        result.animalInstance = Animal.get(params.id)

        if(!result.animalInstance)
            return fail(code:"default.not.found")

        // Success.
        return result
    }

    def update(params) {
        Animal.withTransaction { status ->
            def result = [:]

            def fail = { Map m ->
                status.setRollbackOnly()
                if(result.animalInstance && m.field)
                    result.animalInstance.errors.rejectValue(m.field, m.code)
                result.error = [ code: m.code, args: ["Animal", params.id] ]
                return result
            }

            result.animalInstance = Animal.get(params.id)

            if(!result.animalInstance)
                return fail(code:"default.not.found")

            // Optimistic locking check.
            if(params.version) {
                if(result.animalInstance.version > params.version.toLong())
                    return fail(field:"version", code:"default.optimistic.locking.failure")
            }

            result.animalInstance.properties = params

            if(result.animalInstance.hasErrors() || !result.animalInstance.save())
                return fail(code:"default.update.failure")

            // Success.
            return result

        } //end withTransaction
    }  // end update()

    def create(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["Animal", params.id] ]
            return result
        }

        result.animalInstance = new Animal()
        result.animalInstance.properties = params

        // success
        return result
    }

    def save(params) {
        def result = [:]
        def fail = { Map m ->
            if(result.animalInstance && m.field)
                result.animalInstance.errors.rejectValue(m.field, m.code)
            result.error = [ code: m.code, args: ["Animal", params.id] ]
            return result
        }

        result.animalInstance = new Animal(params)

        if(result.animalInstance.hasErrors() || !result.animalInstance.save(flush: true))
            return fail(code:"default.create.failure")

        // success
        return result
    }



    // PetController
//
//    Pet createPet(String name, Date birthDate, long petTypeId, long ownerId) {
//        def pet = new Pet(name: name, birthDate: birthDate, type: PetType.load(petTypeId), owner: Owner.load(ownerId))
//        pet.save()
//        pet
//    }
//
//    void updatePet(Pet pet, String name, Date birthDate, long petTypeId, long ownerId) {
//        pet.name = name
//        pet.birthDate = birthDate
//        pet.type = PetType.load(petTypeId)
//        pet.owner = Owner.load(ownerId)
//        pet.save()
//    }
//
//    Visit createVisit(long petId, String description, Date date) {
//        def visit = new Visit(pet: Pet.load(petId), description: description, date: date)
//        visit.save()
//        visit
//    }
//
//    // OwnerController
//
//    Owner createOwner(String firstName, String lastName, String address, String city, String telephone) {
//        def owner = new Owner(firstName: firstName, lastName: lastName, address: address, city: city, telephone: telephone)
//        owner.save()
//        owner
//    }
//
//    void updateOwner(Owner owner, String firstName, String lastName, String address, String city, String telephone) {
//        owner.firstName = firstName
//        owner.lastName = lastName
//        owner.address = address
//        owner.city = city
//        owner.telephone = telephone
//        owner.save()
//    }
}
