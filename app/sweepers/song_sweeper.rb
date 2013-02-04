class SongSweeper < ActionController::Caching::Sweeper

  include CacheTriggers

  private

  def expire_cache
    expire_page(controller: 'songs', action: 'show')
    expire_page(controller: 'albums', action: 'show')
  end
end
