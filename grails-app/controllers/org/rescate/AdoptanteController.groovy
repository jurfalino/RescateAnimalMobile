package org.rescate

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class AdoptanteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Adoptante.list(params), model:[adoptanteInstanceCount: Adoptante.count()]
    }

    def show(Adoptante adoptanteInstance) {
        respond adoptanteInstance
    }

    def create() {
        respond new Adoptante(params)
    }

    @Transactional
    def save(Adoptante adoptanteInstance) {
        if (adoptanteInstance == null) {
            notFound()
            return
        }

        if (adoptanteInstance.hasErrors()) {
            respond adoptanteInstance.errors, view:'create'
            return
        }

        adoptanteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'adoptante.label', default: 'Adoptante'), adoptanteInstance.id])
                redirect adoptanteInstance
            }
            '*' { respond adoptanteInstance, [status: CREATED] }
        }
    }

    def edit(Adoptante adoptanteInstance) {
        respond adoptanteInstance
    }

    @Transactional
    def update(Adoptante adoptanteInstance) {
        if (adoptanteInstance == null) {
            notFound()
            return
        }

        if (adoptanteInstance.hasErrors()) {
            respond adoptanteInstance.errors, view:'edit'
            return
        }

        adoptanteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Adoptante.label', default: 'Adoptante'), adoptanteInstance.id])
                redirect adoptanteInstance
            }
            '*'{ respond adoptanteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Adoptante adoptanteInstance) {

        if (adoptanteInstance == null) {
            notFound()
            return
        }

        adoptanteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Adoptante.label', default: 'Adoptante'), adoptanteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'adoptante.label', default: 'Adoptante'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
