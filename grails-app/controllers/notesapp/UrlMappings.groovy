package notesapp

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:"home")
        "/notes"(controller: 'notes')
        "/create"(view: '/notes/create')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}