module CacheTriggers
  def after_create
    expire_cache
  end

  def after_update
    expire_cache
  end

  def after_destroy
    expire_cache
  end
end
