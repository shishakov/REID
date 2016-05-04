import com.reid.REID.UserRole
import com.reid.REID.User
import com.reid.REID.Role
import com.reid.REID.Firma

class BootStrap {

    def init = { servletContext ->

          def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
          def user = User.findOrSaveWhere(username: 'danvega@gmail.com', password: 'password')

        def adminRole2 = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
        def user2 = User.findOrSaveWhere(username: 'danvega5@gmail.com', password: 'password5')

        if ( !user.authorities.contains(adminRole)){
            UserRole.create(user,adminRole,true)
        }
//        def user = new User (username: 'user', password: 'user').save(flush: true)
//        def admin = new User (username: 'admin', password: 'admin').save(flush: true)
//
//        def userRole = new Role (authority: 'ROLE_USER').save(flush: true)
//        def adminRole = new Role (authority: 'ROLE_ADMIN').save(flush: true)
//
//        def firmOne = Firma.findOrSaveWhere(name_firm: 'name_firm', e_mail:'name_firm', addressS: 'name_firm', indexX: 'name_firm', lantitudeS: 'name_firm', longitudeD: 'name_firm', hash_record: 'name_firm', user_id:1).save(flush:true)
//        def firmTwo = new Firm (name_firm: 'name_fir', e_mail:'name_fir',
//                addressS: 'name_fir', indexX: 'name_fir',
////                lantitudeS: 'name_fir', longitudeD: 'name_fir',
////                hash_record: 'name_fir',) .save(flush:true)
//
//        new UserRole(user: user, role: UserRole).save(flush: true)
//        new UserRole(user: admin, role: adminRole).save(flush: true)
    }
    def destroy = {
    }
}
