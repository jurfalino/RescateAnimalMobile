package org.rescate

class FacebookUser {

    Long uid
    String accessToken
    Date accessTokenExpires

    static belongsTo = [user: User]

    static constraints = {
        uid unique: true
    }
}