require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "should save empty note" do
    note = Note.new
    assert note.save, "Saved a note without any data"
  end

  test "should save note with only a title" do
    note = Note.new
    note.Title = 'Hello World'
    assert note.save, "Saved a note with a title"
  end

  test "should save note with only a note" do
    note = Note.new
    note.Note = 'Hello World'
    assert note.save, "Saved a note with a note"
  end

  test "should save note with title, note, link" do
    note = Note.new
    note.Title = 'Title'
    note.Note = 'Note'
    note.Link = 'Link'
    assert note.save, "Saved a full note"
  end

  test "should load fixture by name" do
    note = Note.find_by_Title('MyString 1')
    assert_not_nil note, "Loaded a note by title from fixtures"

    note2 = Note.find(note.id)
    assert_not_nil note2, "Loaded a note by id from fixtures"
  end
end
