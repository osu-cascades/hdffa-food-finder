module NotesHelper
	def date_time(note)
		note.created_at.strftime("%_m/%d/%y - %l:%M %p")
	end
end
