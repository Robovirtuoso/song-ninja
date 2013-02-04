class BandSweeper < ActionController::Caching::Sweeper

  include CacheTriggers

  private

  def expire_cache
    expire_page(controller: 'bands', action: 'index')
  end
end
