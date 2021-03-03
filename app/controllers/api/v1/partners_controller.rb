class Api::V1::PartnersController < ApplicationController
    before_action :restrict_unless_admin
  
    def index
      @partners = Partner.all.sort_by{ |partner| [ partner.name.upcase ] }
    end
  
    def show
      @partner = Partner.find(params[:id])
    end
end