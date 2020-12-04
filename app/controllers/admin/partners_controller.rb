class Admin::PartnersController < ApplicationController
  before_action :restrict_unless_admin

  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
  end

  def new
    @partner = Partner.new
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def create
    @partner = Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.html { redirect_to [:admin, @partner], notice: 'Partner was successfully created.' }
        format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @partner = Partner.find(params[:id])
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to [:admin, @partner], notice: 'Partner was successfully updated.' }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to admin_partners_url, notice: 'Partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def partner_params
      params.require(:partner).permit(:name, :longitude, :latitude, :description,
        :street_address, :city, :state, :zip, :email, :phone, :url, :logo, :product, :email, :description,
        :hours_of_operation)
    end

end
