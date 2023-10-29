program notepad.aleo;

struct Note:
    data0 as u128;
    data1 as u128;
    data2 as u128;
    data3 as u128;
    data4 as u128;
    data5 as u128;
    data6 as u128;
    data7 as u128;


mapping user_notes:
	key left as u128.public;
	value right as Note.public;


mapping note_exists:
	key left as u128.public;
	value right as boolean.public;

function add_note:
    input r0 as Note.private;
    input r1 as u128.private;

    finalize r0 r1;

finalize add_note:
    input r0 as Note.public;
    input r1 as u128.public;
    get note_exists[r1] into r2;
    assert.eq r2 false;
    set r0 into user_notes[r1];
    set true into note_exists[r1];


function remove_note:
    input r0 as u128.private;

    finalize r0;

finalize remove_note:
    input r0 as u128.public;
    get note_exists[r0] into r1;
    assert.eq r1 true;
    remove user_notes[r0];
    set false into note_exists[r0];


function edit_note:
    input r0 as Note.private;
    input r1 as u128.private;

    finalize r0 r1;

finalize edit_note:
    input r0 as Note.public;
    input r1 as u128.public;
    get note_exists[r1] into r2;
    assert.eq r2 true;
    set r0 into user_notes[r1];
