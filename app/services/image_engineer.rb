class ImageEngineer

  def initialize(album, image)
    @title = album.title
    @image = image
  end

  def build
    image
  end

  private

  def image
    Album.where(title: @title).first.update_attribute(:image, @image)
  end
end
