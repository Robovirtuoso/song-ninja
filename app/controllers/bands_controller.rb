class BandsController < ApplicationController
  inherit_resources

  respond_to :html, :json, :js

  def index
    index! do
      @bands.sort_by! { |band| band.name }
    end
  end
end
