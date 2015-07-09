package org.rescate

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AnimalController {
    
    def animalService
	def animalEventService

   def list = { redirect(action:index,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'DELETE', save:'POST', update:'PUT']

//     def indexDefault = {
//         params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
//         [ animalInstanceList: Animal.list( params ), animalInstanceTotal: Animal.count() ]
//     }

    def index = {
        def result = animalService.list(params)
        if(!result.error) {
            return [ animalInstanceList: result.animalInstanceList,
                     animalInstanceTotal: result.animalInstanceTotal ]
        }

        flash.message = g.message(code: result.error.code, args: result.error.args)
        //redirect( url: resource(dir:'') )
    }

//     def showDefault = {
//         def animalInstance = Animal.get( params.id )
//
//         if(!animalInstance) {
//             flash.message = "Animal not found with id ${params.id}"
//             redirect(action:list)
//         }
//         else { return [ animalInstance : animalInstance ] }
//     }

    def show = {
        def result = animalService.show(params)

        if(!result.error)
            return [ animalInstance: result.animalInstance ]

        flash.message = g.message(code: result.error.code, args: result.error.args)
        redirect(action: index)
    }

//     def deleteDefault = {
//         def animalInstance = Animal.get( params.id )
//         if(animalInstance) {
//             try {
//                 animalInstance.delete(flush:true)
//                 flash.message = "Animal ${params.id} deleted"
//                 redirect(action:list)
//             }
//             catch(org.springframework.dao.DataIntegrityViolationException e) {
//                 flash.message = "Animal ${params.id} could not be deleted"
//                 redirect(action:show,id:params.id)
//             }
//         }
//         else {
//             flash.message = "Animal not found with id ${params.id}"
//             redirect(action:list)
//         }
//     }

    def delete = {
        def result = animalService.delete(params)

        if(!result.error) {
            flash.message = g.message(code: "default.deleted.message", args: ["Animal", params.id])
            redirect(action:index)
            return
        }

        flash.message = g.message(code: result.error.code, args: result.error.args)

        if(result.error.code == "default.not.found") {
            redirect(action:index)
            return
        }

        redirect(action:show, id: params.id)
    }

//     def editDefault = {
//         def animalInstance = Animal.get( params.id )
// 
//         if(!animalInstance) {
//             flash.message = "Animal not found with id ${params.id}"
//             redirect(action:list)
//         }
//         else {
//             return [ animalInstance : animalInstance ]
//         }
//     }

    def edit = {
        def result = animalService.edit(params)

        if(!result.error)
            return [ animalInstance : result.animalInstance ]

        flash.message = g.message(code: result.error.code, args: result.error.args)
        redirect(action: index)
    }

//     def updateDefault = {
//         def animalInstance = Animal.get( params.id )
//         if(animalInstance) {
//             if(params.version) {
//                 def version = params.version.toLong()
//                 if(animalInstance.version > version) {
// 
//                     animalInstance.errors.rejectValue("version", "animal.optimistic.locking.failure", "Another user has updated this Animal while you were editing.")
//                     render(view:'edit',model:[animalInstance:animalInstance])
//                     return
//                 }
//             }
//             animalInstance.properties = params
//             if(!animalInstance.hasErrors() && animalInstance.save()) {
//                 flash.message = "Animal ${params.id} updated"
//                 redirect(action:show,id:animalInstance.id)
//             }
//             else {
//                 render(view:'edit',model:[animalInstance:animalInstance])
//             }
//         }
//         else {
//             flash.message = "Animal not found with id ${params.id}"
//             redirect(action:list)
//         }
//     }

    def update = {
        def result = animalService.update(params)

        if(!result.error) {
            flash.message = g.message(code: "default.updated.message", args: ["Animal", params.id])
            redirect(action:show, id: params.id)
            return
        }

        if(result.error.code == "default.not.found") {
            flash.message = g.message(code: result.error.code, args: result.error.args)
            redirect(action:index)
            return
        }

        render(view:'edit', model:[animalInstance: result.animalInstance.attach()])
    }

//     def createDefault = {
//         def animalInstance = new Animal()
//         animalInstance.properties = params
//         return ['animalInstance':animalInstance]
//     }

    def create = {
        def result = animalService.create(params)

        if(!result.error)
            return [animalInstance: result.animalInstance]

        flash.message = g.message(code: result.error.code, args: result.error.args)
        redirect(action: index)
    }

//     def saveDefault = {
//         def animalInstance = new Animal(params)
//         if(!animalInstance.hasErrors() && animalInstance.save()) {
//             flash.message = "Animal ${animalInstance.id} created"
//             redirect(action:show,id:animalInstance.id)
//         }
//         else {
//             render(view:'create',model:[animalInstance:animalInstance])
//         }
//     }

    def save = {
        def result = animalService.save(params)

        if(!result.error) {
            flash.message = g.message(code: "default.created.message", args: ["Animal", result.animalInstance.id])
            redirect(action:show, id: result.animalInstance.id)
            return
        }

        render(view:'create', model:[animalInstance: result.animalInstance])
    }

	def createAnimalEvent = {
		def result  = animalService.save(params)
		def result2 = animalEventService.create(result.animalInstance.id)
		
		if(!result.error) {
			flash.message = g.message(code: "default.created.message", args: ["Animal", result.animalInstance.id])
			render(view:'create',model:[animalEventInstance:result2.animalEventInstance])
			//redirect(controller: 'animalEvent', action:'create', id: result.animalInstance.id)
			//return
		}

		render(view:'create', model:[animalInstance: result.animalInstance])
	}

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
//
//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Animal.list(params), model:[animalInstanceCount: Animal.count()]
//    }
//
//    def show(Animal animalInstance) {
//        respond animalInstance
//    }
//
//    def create() {
//        respond new Animal(params)
//    }
//
//    @Transactional
//    def save(Animal animalInstance) {
//        if (animalInstance == null) {
//            notFound()
//            return
//        }
//
//        if (animalInstance.hasErrors()) {
//            respond animalInstance.errors, view:'create'
//            return
//        }
//
//        animalInstance.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'animal.label', default: 'Animal'), animalInstance.id])
//                redirect animalInstance
//            }
//            '*' { respond animalInstance, [status: CREATED] }
//        }
//    }
//
//    def edit(Animal animalInstance) {
//        respond animalInstance
//    }
//
//    @Transactional
//    def update(Animal animalInstance) {
//        if (animalInstance == null) {
//            notFound()
//            return
//        }
//
//        if (animalInstance.hasErrors()) {
//            respond animalInstance.errors, view:'edit'
//            return
//        }
//
//        animalInstance.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'Animal.label', default: 'Animal'), animalInstance.id])
//                redirect animalInstance
//            }
//            '*'{ respond animalInstance, [status: OK] }
//        }
//    }
//
//    @Transactional
//    def delete(Animal animalInstance) {
//
//        if (animalInstance == null) {
//            notFound()
//            return
//        }
//
//        animalInstance.delete flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Animal.label', default: 'Animal'), animalInstance.id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
//    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }
}
