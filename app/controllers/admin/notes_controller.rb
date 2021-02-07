class Admin::NotesController < ApplicationController
    # before_action :restrict_unless_admin


    def index
      @notes = Note.all.order("created_at DESC")
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
      # @note = Note.new(note_params)
      @note = @partner.notes.build(note_params)
      #@note.user_id = current_user.id
      @note.user = current_user

      respond_to do |format|
        if @note.save
          format.html { redirect_to [:admin, @partner], notice: 'Note was successfully created.' }
          format.json { render json: @note, status: :created, location: @note }
        else
          format.html { render :new }
          # format.html { render action: "new" }
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

    private

      def note_params
        params.require(:note).permit(:title, :body, :user, :partner_id, :id)
      end

  end
