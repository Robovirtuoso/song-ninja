class BandsController < ApplicationController
  inherit_resources

  respond_to :html, :json, :js

  def index
    index! do
      @bands = Band.order(:name)
    end
  end
end
