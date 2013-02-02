class BandSweeper < ActionController::Caching::Sweeper

  def after_create
    expire_cache
  end

  def after_update
    expire_cache
  end

  def after_destroy
    expire_cache
  end

  private

  def expire_cache
    expire_page(controller: 'bands', action: 'index')
    expire_fragment('album_index')
  end
end
