class SongsController < ApplicationController
  inherit_resources

  def index
    @band = Band.find(params[:band_id])
    super
  end
end
