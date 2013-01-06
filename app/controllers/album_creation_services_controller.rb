class AlbumCreationServicesController < ApplicationController

  def new
    @album_creation_services = AlbumCreationServices.new
  end

  def create
    @album_creation_services = AlbumCreationServices.create(params[:album_creation_service])
  end
end
