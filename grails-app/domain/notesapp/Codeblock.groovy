package notesapp

class Codeblock extends BaseNote {

    String additional

    static constraints = {
        additional nullable: false
    }
}
