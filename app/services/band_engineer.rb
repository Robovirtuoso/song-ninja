class BandEngineer

  def initialize(band)
    @band = band
  end

  def build
    band
  end

  private

  def band
    Band.where(name: @band).first_or_create
  end
end
