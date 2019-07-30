package notesapp

class Bookmark extends BaseNote {

    String additional

    static constraints = {
        additional nullable: false
    }
}
