package notesapp

import grails.transaction.Transactional

@Transactional
class NoteService {

    BaseNote getNote(int id) {
        return BaseNote.get(id)
    }

    ArrayList<BaseNote> getAllNotes() {
        return BaseNote.listOrderByLastUpdated(order: "desc")
    }

    ArrayList<BaseNote> getNotesByType(String noteType) {
        switch (noteType) {
            case 'sites': return Bookmark.listOrderByLastUpdated(order: "desc")
            case 'code': return Codeblock.listOrderByLastUpdated(order: "desc")
            case 'quotes': return Quote.listOrderByLastUpdated(order: "desc")
            case 'todos': return Todo.listOrderByLastUpdated(order: "desc")
            default: return Note.listOrderByLastUpdated(order: "desc")
        }
    }

    String createNote(String noteType, String content, String additional) {
        switch (noteType) {
            case 'site': new Bookmark(content: content, additional: additional).save(flush: true)
                break
            case 'code': new Codeblock(content: content, additional: additional).save(flush: true)
                break
            case 'quote': new Quote(content: content, additional: additional).save(flush: true)
                break
            case 'todo': new Todo(content: content, additional: false).save(flush: true)
                break
            default: new Note(content: content).save(flush: true)
        }

        return noteType.capitalize() + " Added"
    }

    String updateNote(int id, String content, String additional) {
        BaseNote note = BaseNote.get(id)
        String noteType = note.class.toString().minus('class notesapp.')

        switch (noteType) {
            case 'Note':
                break
            case 'Todo': note.additional = false
                break
            default: note.additional = additional
        }
        note.content = content
        note.save(flush: true)

        return noteType + " Updated"
    }

    String deleteNote(int id) {
        String noteType = BaseNote.get(id).class.toString().minus('class notesapp.')
        BaseNote.get(id).delete(flush: true)

        return noteType + " Deleted"
    }

    String markTodoCompletion(int id) {
        Todo todo = Todo.get(id)
        todo.additional = !todo.additional

        if (todo.additional) return "Todo Completed!"
        else return "Todo Marked Incomplete"
    }
}