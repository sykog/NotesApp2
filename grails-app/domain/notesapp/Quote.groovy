package notesapp

class Quote extends BaseNote {

    String additional

    static constraints = {
        additional nullable: false
    }
}
