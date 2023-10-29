program notepad.aleo {

    struct Note {
        data0: u128,
        data1: u128,
        data2: u128,
        data3: u128,
        data4: u128,
        data5: u128,
        data6: u128,
        data7: u128,
    }

    mapping user_notes: u128 => Note;
    mapping note_exists: u128 => bool;  // Mapping to track note existence

    transition add_note(new_note: Note, note_id: u128)  {
        return then finalize(new_note, note_id);
    }
    finalize add_note(new_note: Note, note_id: u128)  {
        let contains_note: bool = Mapping::get(note_exists, note_id);
        assert_eq(contains_note, false); // notes with this id already exist
        Mapping::set(user_notes, note_id, new_note);
        Mapping::set(note_exists, note_id, true);  // Mark this note ID as used
    }

    transition remove_note(note_id: u128)  {
        return then finalize(note_id);
    }
    finalize remove_note(note_id: u128)  {
        let contains_note: bool = Mapping::get(note_exists, note_id);
        assert_eq(contains_note, true); // make sure note with this id exists before deleting
        Mapping::remove(user_notes, note_id);
        Mapping::set(note_exists, note_id, false);  // Mark this note ID as unused
    }

    transition edit_note(new_note: Note, note_id: u128)  {
        return then finalize(new_note, note_id);
    }
    finalize edit_note(new_note: Note, note_id: u128)  {
        let contains_note: bool = Mapping::get(note_exists, note_id);
        assert_eq(contains_note, true); // check if notes with this id already exist
        Mapping::set(user_notes, note_id, new_note);
    }
}
