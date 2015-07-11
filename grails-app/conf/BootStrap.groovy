import java.util.Date;
import org.codehaus.groovy.grails.web.taglib.*
import org.rescate.*

class BootStrap {

    def init = { servletContext ->

		GrailsTagRegistry.getInstance().registerTag(org.rescate.DynEachTag.TAG_NAME, org.rescate.DynEachTag.class)
		
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)

        def user1 = User.findByUsername('jona') ?: new User(username: 'jona',  enabled: true, firstName: 'jon', lastName: 'urfa', accountLocked: false, passwordExpired: false, accountExpired: false, password: 'pass').save(flush: true)
        if (!user1.authorities.contains(userRole)){
            UserRole.create user1, userRole, true
        }

        def user2 = User.findByUsername('admin') ?: new User(username: 'admin', enabled: true, firstName: 'adm', lastName: 'in', accountLocked: false, passwordExpired: false, accountExpired: false, password: 'pass').save(flush: true)
        if (!user2.authorities.contains(userRole)){
            UserRole.create user2, userRole, true
        }
        if (!user2.authorities.contains(adminRole)){
            UserRole.create user2, adminRole, true
        }

        //def mainrolegroup = RoleGroup.findByName('MAIN') ?: new RoleGroup('MAIN')
        //def userrolegroup = UserRoleGroup.findByUser(user2) ?: new UserRoleGroup(user2, mainrolegroup)

        assert User.count() == 2
        assert Role.count() == 2
        assert UserRole.count() == 3

		Animal.withTransaction {
			def animal1Nac = new AnimalEvent(eventType: 'nacimiento', eventDate: new Date(), comments:'comments')
			def animal1Cas = new AnimalEvent(eventType: 'castracion', eventDate: new Date(), comments:'castracion')
			def animal1 = new Animal(nombre: 'gat1', especie: 'Gato',color: 'Blanco',pelo: 'Corto', raza: 'Comun', edad:'<= 1 mes', dateOfIntake:new Date(), dateNeutered:new Date())
			animal1.addToEventos(animal1Nac)
			animal1.addToEventos(animal1Cas)
			animal1.save(flush:true,  insert: true)
        }
		
    }
    def destroy = {
    }
}
