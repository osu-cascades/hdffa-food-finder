class PartnersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
  end

  def search
    @partners = Partner.where("name LIKE ?","%" + params[:q] + "%")
  end

end
