class Admin::WelcomeController < ApplicationController
  before_action :restrict_unless_admin

  def home
    @notes = Note.all
	end
end