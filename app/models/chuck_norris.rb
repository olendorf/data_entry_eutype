class ChuckNorris < ActiveRecord::Base
  
  include Elasticsearch::Model
  
  serialize :kungfu, Schemas::ChuckNorrisKungfu
    
end
