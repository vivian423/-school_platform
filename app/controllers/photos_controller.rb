class PhotosController < ApplicationController

  def new
    @photo = Photo.new
    authorize @photo
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = user

    authorize @photo

    @photo.save
    redirect_to photos_path
  end

  def index
    @photos = Photo.all
    authorize @photos
  end

  def destroy
  end


    private

    def photo_params
      params.require(:photo).permit(:photo)
    end
end
