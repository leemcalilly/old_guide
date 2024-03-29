class PhotosController < ApplicationController
  load_and_authorize_resource
  
  before_filter :require_login
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  def index
    @photos = Photo.order('created_at DESC').to_a  
    @photo = Photo.new    
  end

  # GET /photos/1
  def show
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to photos_url, notice: 'Photo created!' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  # PATCH/PUT /photos/1
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo updated!' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params       
       params.fetch(:photo, {}).permit(:image)
    end
end
