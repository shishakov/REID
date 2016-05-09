import com.reid.REID.*

class BootStrap {

    def init = { servletContext ->

        def userRole = Role.findOrSaveWhere(authority: 'ROLE_USER')
        def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')

        def userUser = User.findOrSaveWhere(username: 'user', password: 'user', enabled: true, importRun:false)
        def userUserEug = User.findOrSaveWhere(username: 'userEug', password: 'userEug', enabled: true, importRun:false)
        def adminUser = User.findOrSaveWhere(username: 'admin', password: 'admin', enabled: true,importRun:false)

        UserRole.create userUser, userRole
        UserRole.create userUserEug, userRole
        UserRole.create adminUser, adminRole

        def firmOne = Firma.findOrSaveWhere(name_firm: 'WalmartR', e_mail:'walmart@gmail.comR', addressS: 'ул. Сосновый бор 6 Минск Беларусь', indexX: '220465', lantitudeS: '220465', longitudeD: '220465', hash_record: '220465')
        firmOne.user = userUser
        firmOne.save(flush: true)
    }
    def destroy = {
    }
}
