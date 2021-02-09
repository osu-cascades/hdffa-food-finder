class Admin::WelcomeController < ApplicationController
  before_action :restrict_unless_admin

<<<<<<< HEAD
  def index
    @notes = Note.all
=======
    def home
  	@notes = Note.all
>>>>>>> develop
  end
end