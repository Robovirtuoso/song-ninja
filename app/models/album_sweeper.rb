class AlbumSweeper < ActionController::Caching::Sweeper

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
    expire_page(controller: 'albums', action: 'show')
    expire_page(controller: 'bands', action: 'index')
  end
end
