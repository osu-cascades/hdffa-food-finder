class ProvidersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
  end

end
