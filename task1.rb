
class Apple < ApplicationRecord
    
    include Blending

end

class Orange < ApplicationRecord

    include Blending
    
end



module Blending
    extend ActiveSupport::Concern

    included do
        after_save do 
            make_juice if self.is_a? Apple
        end
    end

    def make_juice
        puts "Making #{self.class} Juice........"
    end

end
