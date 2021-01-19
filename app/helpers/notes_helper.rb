module NotesHelper
	def date_time(note)
		note.created_at.strftime("%m/%d/%y - %I:%M %p")
	end
end
