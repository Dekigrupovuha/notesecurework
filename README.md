![alt text](imgs/aleo-notepad0.png "Title")

# Notepad Smart Contract on Aleo
[![Follow me on Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/DekiDima)
[![Discord: @dmitrydeki](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)](@dmitrydeki)
[![Me on Telegram](https://img.shields.io/badge/Telegram-%235865F2.svg?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/dmitrydeki)


# Notepad on Aleo

A simple notepad application implemented using Aleo's programming language.

## Structure

This program allows users to perform the following operations on notes:

1. **Add a Note**: Add a new note with a unique ID.
2. **Remove a Note**: Remove an existing note using its ID.
3. **Edit a Note**: Edit an existing note using its ID.

Each note consists of 8 fields (`data0` to `data7`) of type `u128`.

## Program Components

### Structs

- **Note**: Represents a note with 8 data fields of type `u128`.

### Mappings

- **user_notes**: Mapping of note IDs (`u128`) to `Note`.
- **note_exists**: Mapping to track the existence of notes. Maps note IDs to a boolean indicating whether the note exists.

### Transitions and Finalizers

- **add_note**: Adds a new note. Checks for the existence of the note ID and raises an error if a note with the given ID already exists.
- **remove_note**: Removes an existing note. Raises an error if no note with the given ID exists.
- **edit_note**: Edits an existing note. Raises an error if no note with the given ID exists.

## Input Data

The input data should be structured as follows:

- For **add_note**:
  ```plaintext
  [add_note]
  new_note: Note { data0: ..., data1: ..., ... };
  note_id: u128 = ...;
  ```

- For **remove_note**:
  ```plaintext
  [remove_note]
  note_id: u128 = ...;
  ```

- For **edit_note**:
  ```plaintext
  [edit_note]
  new_note: Note { data0: ..., data1: ..., ... };
  note_id: u128 = ...;
  ```

## How to Run

To run the notepad program:

1. Ensure you have the Aleo development environment set up.
2. Place your desired inputs in an `input.dat` file.
3. Run the program using:
   ```bash
   leo run --inputs input.dat
   ```

---

I hope this README gives a clear overview of the `notepad` program and its usage. Adjust as needed to fit your specific requirements or additional features.