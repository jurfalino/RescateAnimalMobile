package org.rescate


import grails.test.mixin.*
import spock.lang.*

@TestFor(AnimalEventController)
@Mock(AnimalEvent)
class AnimalEventControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.animalEventInstanceList
        model.animalEventInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.animalEventInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def animalEvent = new AnimalEvent()
        animalEvent.validate()
        controller.save(animalEvent)

        then: "The create view is rendered again with the correct model"
        model.animalEventInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        animalEvent = new AnimalEvent(params)

        controller.save(animalEvent)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/animalEvent/show/1'
        controller.flash.message != null
        AnimalEvent.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def animalEvent = new AnimalEvent(params)
        controller.show(animalEvent)

        then: "A model is populated containing the domain instance"
        model.animalEventInstance == animalEvent
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def animalEvent = new AnimalEvent(params)
        controller.edit(animalEvent)

        then: "A model is populated containing the domain instance"
        model.animalEventInstance == animalEvent
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/animalEvent/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def animalEvent = new AnimalEvent()
        animalEvent.validate()
        controller.update(animalEvent)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.animalEventInstance == animalEvent

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        animalEvent = new AnimalEvent(params).save(flush: true)
        controller.update(animalEvent)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/animalEvent/show/$animalEvent.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/animalEvent/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def animalEvent = new AnimalEvent(params).save(flush: true)

        then: "It exists"
        AnimalEvent.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(animalEvent)

        then: "The instance is deleted"
        AnimalEvent.count() == 0
        response.redirectedUrl == '/animalEvent/index'
        flash.message != null
    }
}
