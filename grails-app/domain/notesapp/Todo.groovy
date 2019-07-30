package notesapp

class Todo extends BaseNote {

    Boolean additional

    static constraints = {
        additional nullable: false
    }

    static mapping = {
        additional column: 'complete'
    }
}