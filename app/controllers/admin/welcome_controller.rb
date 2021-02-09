class Admin::WelcomeController < ApplicationController
  before_action :restrict_unless_admin

  def index
    @notes = Note.all
  end
end