'require json'
class Api::V1::PartnersController < ApplicationController
    before_action :restrict_unless_admin
  
    def index
      @partners = Partner.all.sort_by{ |partner| [ partner.name.upcase ] }
    end
  
    def show
      @partner = Partner.find(params[:id])
      # render json: { data: pretty_print(partner)}
      # render json: { data: render_to_string('show.html.haml') }
      render json: {data: @partner}
    end
end