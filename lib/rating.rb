module Rating
  class << self
    EXCLUDED_CITIES = ['Москва', 'Санкт-Петербург']

    # TODO: build rating by products, cache it
    # TODO: check city for exclusion
    def top(count = 10, excluded_cities = EXCLUDED_CITIES)
      h = {}
      Transaction.all.each do |t|
        if h.key?(t.product.name)
          h[t.product.name] += t.value
        else
          h[t.product.name] = t.value
        end
      end
      h = h.sort { |a, b| b[1] <=> a[1] }
      h.first(count)
    end
  end
end
