class Admin < ActiveRecord::Base
  establish_connection(:development_cms)
end
