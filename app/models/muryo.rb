class Muryo < ActiveRecord::Base
  belongs_to :prefecture
  belongs_to :city
end
