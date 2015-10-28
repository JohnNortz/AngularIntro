class Gemstone < ActiveRecord::Base
  validates :name, presence: true

  #self.site = "http://localhost:4000"
end
