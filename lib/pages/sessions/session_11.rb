# page object
module Pages
  # for session 11
  module SessionEleven
    class << self
      def title
        'Haz las cosas a tu propio ritmo'
      end

      def start
        tags('android.view.View')[35].click
      end
    end
  end
end

# create reference
module Kernel
  def session_11
    Pages::SessionEleven
  end
end
