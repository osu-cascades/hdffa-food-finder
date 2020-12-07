require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test 'Note has a title' do
    assert_respond_to(Note.new, :title)
  end

  test 'Note has a body' do
    assert_respond_to(Note.new, :body)
  end

  test 'Note belongs to a partner' do
    assert_respond_to(Note.new, :partner)
  end

  test 'Note belongs to a user' do
    assert_respond_to(Note.new, :user)
  end

  test 'Note without a title is invalid' do
    note = notes(:one)
    assert note.valid?
    note.title = ''
    refute note.valid?
  end

  test 'Note without a body is invalid' do
    note = notes(:one)
    assert note.valid?
    note.body = ''
    refute note.valid?
  end

end
