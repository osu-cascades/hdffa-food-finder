class Admin::NotesController < ApplicationController

  def index
    @notes = Note.all
  end
  
  def show
    @note = Note.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @note }
    end
  end

  def new
    @note = Note.new
    @partner = Partner.find(params[:partner_id])
    respond_to do |format|
      format.html
      format.json { render json: @note }
    end
  end

  def edit
    @note = Note.find(params[:id])
    @partner = Partner.find(@note.partner_id)
  end

  def create
    @partner = Partner.find(params[:partner_id])
    @note = @partner.notes.build(params[:note])
    respond_to do |format|
      if @note.save
        format.html { redirect_to @partner, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @note = Note.find(params[:id])
    @partner = Partner.find(@note.partner_id)
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @partner, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
