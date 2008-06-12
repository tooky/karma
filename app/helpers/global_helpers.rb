module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  
    def textile(str)
      RedCloth.new(str).to_html
    end
  end
end
