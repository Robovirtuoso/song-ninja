class BandsController < ApplicationController
  inherit_resources

  caches_action :index
  cache_sweeper :band_sweeper

  respond_to :html, :json, :js

  def index
    index! do
      @bands = Band.order(:name)
    end
  end
end
