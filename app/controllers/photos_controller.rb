class PhotosController < ApplicationController

  def new
    @photo = Photo.new
    authorize @photo
  end

  def create
    @photo = Photo.new(photo_params)

    authorize @photo

    @photo.save
    redirect_to photos_path
  end

  def index
    @photos = policy_scope(Photo)
    @photo = Photo.new
    current_user.notifications.where(params[:type] == "photo").mark_as_read!
  end

  def destroy
    @photo = Photo.find(params[:id])
    authorize @photo
    @photo.destroy
    redirect_to photos_path, status: :see_other
  end


  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
