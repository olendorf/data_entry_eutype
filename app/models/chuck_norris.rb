class ChuckNorris < ActiveRecord::Base
    serialize :kungfu, Schemas::ChuckNorrisKungfu
    
end
