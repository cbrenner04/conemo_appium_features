# page object
module Pages
  # for home page
  module Home
    class << self
      def assert_on_page
        wait { find 'Sesiones' }
      end
    end
  end
end

# initialize
module Kernel
  def home
    Pages::Home
  end
end
