module BubbleWrap
  module Cloud
    module_function

    def key_store
      NSUbiquitousKeyValueStore.defaultStore
    end

    def key_store_available?
      !!key_store
    end

    def []=(key, value)
      key_store.setObject(value, forKey:key)
    end

    def [](key)
      key_store.objectForKey(key)
    end

    def synchronize
      key_store.synchronize
    end
  end
end