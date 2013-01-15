class ImageEngineer

  def initialize(album, image)
    @album = album
    @image = image
  end

  def build
    image
  end

  private

  def image
    @album.update_attribute(:image, @image)
  end
end
