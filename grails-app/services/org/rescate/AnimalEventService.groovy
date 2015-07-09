package org.rescate

import grails.transaction.Transactional

@Transactional
class AnimalEventService {

    boolean transactional = false

    def list(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["AnimalEvent"] ]
            return result
        }

        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        result.animaleventInstanceList = AnimalEvent.list(params)
        result.animaleventInstanceTotal = AnimalEvent.count()

        if(!result.animaleventInstanceList || !result.animaleventInstanceTotal)
            return fail(code:"default.list.failure")

        // Success.
        return result
    }

    def show(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["AnimalEvent", params.id] ]
            return result
        }

        result.animaleventInstance = AnimalEvent.get(params.id)

        if(!result.animaleventInstance)
            return fail(code:"default.not.found")

        // Success.
        return result
    }

    def delete(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["AnimalEvent", params.id] ]
            return result
        }

        result.animaleventInstance = AnimalEvent.get(params.id)

        if(!result.animaleventInstance)
            return fail(code:"default.not.found")

        try {
            result.animaleventInstance.delete(flush:true)
            return result //Success.
        }
        catch(org.springframework.dao.DataIntegrityViolationException e) {
            return fail(code:"default.delete.failure")
        }

    }

    def edit(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["AnimalEvent", params.id] ]
            return result
        }

        result.animaleventInstance = AnimalEvent.get(params.id)

        if(!result.animaleventInstance)
            return fail(code:"default.not.found")

        // Success.
        return result
    }

    def update(params) {
        AnimalEvent.withTransaction { status ->
            def result = [:]

            def fail = { Map m ->
                status.setRollbackOnly()
                if(result.animaleventInstance && m.field)
                    result.animaleventInstance.errors.rejectValue(m.field, m.code)
                result.error = [ code: m.code, args: ["AnimalEvent", params.id] ]
                return result
            }

            result.animaleventInstance = AnimalEvent.get(params.id)

            if(!result.animaleventInstance)
                return fail(code:"default.not.found")

            // Optimistic locking check.
            if(params.version) {
                if(result.animaleventInstance.version > params.version.toLong())
                    return fail(field:"version", code:"default.optimistic.locking.failure")
            }

            result.animaleventInstance.properties = params

            if(result.animaleventInstance.hasErrors() || !result.animaleventInstance.save())
                return fail(code:"default.update.failure")

            // Success.
            return result

        } //end withTransaction
    }  // end update()

    def create(params) {
        def result = [:]
        def fail = { Map m ->
            result.error = [ code: m.code, args: ["AnimalEvent", params.id] ]
            return result
        }

        result.animaleventInstance = new AnimalEvent()
        result.animaleventInstance.properties = params

        // success
        return result
    }

    def save(params) {
        def result = [:]
        def fail = { Map m ->
            if(result.animaleventInstance && m.field)
                result.animaleventInstance.errors.rejectValue(m.field, m.code)
            result.error = [ code: m.code, args: ["AnimalEvent", params.id] ]
            return result
        }

        result.animaleventInstance = new AnimalEvent(params)

        if(result.animaleventInstance.hasErrors() || !result.animaleventInstance.save(flush: true))
            return fail(code:"default.create.failure")

        // success
        return result
    }

}
