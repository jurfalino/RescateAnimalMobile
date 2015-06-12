package org.rescate


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AnimalEventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AnimalEvent.list(params), model: [animalEventInstanceCount: AnimalEvent.count()]
    }

    def show(AnimalEvent animalEventInstance) {
        respond animalEventInstance
    }

    def create() {
        respond new AnimalEvent(params)
    }

    @Transactional
    def save(AnimalEvent animalEventInstance) {
        if (animalEventInstance == null) {
            notFound()
            return
        }

        if (animalEventInstance.hasErrors()) {
            respond animalEventInstance.errors, view: 'create'
            return
        }

        animalEventInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'animalEvent.label', default: 'AnimalEvent'), animalEventInstance.id])
                redirect animalEventInstance
            }
            '*' { respond animalEventInstance, [status: CREATED] }
        }
    }

    def edit(AnimalEvent animalEventInstance) {
        respond animalEventInstance
    }

    @Transactional
    def update(AnimalEvent animalEventInstance) {
        if (animalEventInstance == null) {
            notFound()
            return
        }

        if (animalEventInstance.hasErrors()) {
            respond animalEventInstance.errors, view: 'edit'
            return
        }

        animalEventInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AnimalEvent.label', default: 'AnimalEvent'), animalEventInstance.id])
                redirect animalEventInstance
            }
            '*' { respond animalEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AnimalEvent animalEventInstance) {

        if (animalEventInstance == null) {
            notFound()
            return
        }

        animalEventInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AnimalEvent.label', default: 'AnimalEvent'), animalEventInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'animalEvent.label', default: 'AnimalEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
