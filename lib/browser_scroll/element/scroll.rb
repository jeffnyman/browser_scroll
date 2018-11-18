module Watir
  class Element
    class Scroll
      def initialize(element)
        @element = element
      end

      def to
        self
      end

      def scroll_to
        top
      end

      def top
        execute('arguments[0].scrollIntoView();', @element)
        self
      end

      def bottom
        execute('arguments[0].scrollIntoView(false);', @element)
        self
      end

      def middle
        script = <<-JS
          var bodyRect = document.body.getBoundingClientRect();
          var elementRect = arguments[0].getBoundingClientRect();
          var left = (elementRect.left - bodyRect.left) - (window.innerWidth / 2);
          var top = (elementRect.top - bodyRect.top) - (window.innerHeight / 2);
          window.scrollTo(left, top);
        JS
        execute(script, @element)
        self
      end

      def by(left, top)
        execute(
          'window.scrollBy(arguments[0], arguments[1]);',
          Integer(left), Integer(top)
        )
        self
      end

      private

      def execute(*args)
        @element.browser.execute_script(*args)
      end
    end
  end
end
