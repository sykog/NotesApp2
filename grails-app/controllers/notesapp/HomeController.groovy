package notesapp

class HomeController {

    def index() {
        redirect(controller: "notes")
    }
}