module Watir
  class Browser
    class Scroll
      def initialize(browser)
        @browser = browser
      end

      def to(param = nil)
        if !param.nil? && param.is_a?(Array)
          unless param.is_a?(Array)
            raise ArgumentError, "Unable to scroll to: #{param}."
          end

          execute(
            'window.scrollTo(arguments[0], arguments[1]);',
            Integer(param[0]), Integer(param[1])
          )
        end
        self
      end

      def top
        execute('window.scrollTo(0, 0);')
        self
      end

      def bottom
        execute('window.scrollTo(0, document.body.scrollHeight);')
        self
      end

      def middle
        execute(
          'window.scrollTo(window.outerWidth / 2, window.outerHeight / 2);'
        )
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
        @browser.execute_script(*args)
      end
    end
  end
end
