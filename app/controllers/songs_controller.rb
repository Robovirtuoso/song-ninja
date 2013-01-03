class SongsController < ApplicationController
  inherit_resources

  include ApplicationHelper

  respond_to :html, :json, :js

  def index
    @band = Band.find(params[:band_id])
    super
  end

  def update
    update! do |success, failure|
      success.html { redirect_to [current_user, @song.band, @song] }
      failure.html { redirect_to [current_user, @song.band, @song] }
    end
  end
end
