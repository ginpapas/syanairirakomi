class City < ActiveRecord::Base
  has_many :directories
  has_many :muryos
  belongs_to :prefecture
end
