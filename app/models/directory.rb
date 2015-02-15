class Directory < ActiveRecord::Base
  belongs_to :prefecture
  has_one :operator
end
