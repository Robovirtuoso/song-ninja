class BandsController < ApplicationController
  inherit_resources

  respond_to :html, :json, :js

  def index
    index! do
      @bands = Band.order(:name)
    end
  end

  def update
    @band = Band.find(params[:id])
    @band.update_attributes(band_params)
    super
  end

  private

  def band_params
    permitted_params.current_model(:band)
  end
end
