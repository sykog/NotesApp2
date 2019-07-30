package notesapp

abstract class BaseNote {

    String content
    Date dateCreated
    Date lastUpdated

    static constraints = {
        content nullable:false
    }
}