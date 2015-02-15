class Prefecture < ActiveRecord::Base
  has_many :directories
  has_many :muryos
  has_many :cities
end
