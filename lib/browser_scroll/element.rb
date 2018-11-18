module Watir
  class Element
    def scroll
      Scroll.new(self)
    end
  end
end
