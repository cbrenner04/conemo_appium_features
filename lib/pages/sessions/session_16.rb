# page object
module Pages
  # for session 16
  module SessionSixteen
    class << self
      def title
        '¡Los cambios toman tiempo!'
      end

      def start
        tags('android.view.View')[50].click
      end
    end
  end
end

# create reference
module Kernel
  def session_16
    Pages::SessionSixteen
  end
end
