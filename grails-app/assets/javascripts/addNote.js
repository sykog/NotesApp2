window.onload = () => {
    const noteSelect = document.querySelector('select');
    const additionalInput = document.getElementById('additional');
    additionalInput.style.display = 'none';

    noteSelect.onchange = () => {
        switchNoteForm(noteSelect.value)
    }

    const switchNoteForm = noteType => {
        switch (noteType) {
            case 'todo':
                additionalInput.style.display = 'none';
                additionalInput.value = 'false';
                break;
            case 'quote':
                additionalInput.style.display = 'block';
                additionalInput.value = 'source';
                break;
            case 'code':
                additionalInput.style.display = 'block';
                additionalInput.value = 'language';
                break;
            case 'site':
                additionalInput.style.display = 'block';
                additionalInput.value = 'website';
                break;
            default:
                additionalInput.style.display = 'none';
                additionalInput.value = '';
        }
    }
}