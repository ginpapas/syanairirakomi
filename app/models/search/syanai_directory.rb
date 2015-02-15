class Search::SyanaiDirectory < Search::Base
  attr_accessor :second_category_id
  attr_accessor :prefecture_id
  attr_accessor :city_id
  attr_accessor :name

  def initialize(attributes = {})
    super attributes if attributes.present?
  end

  def matches
    directory = Directory.all
    if self.second_category_id.present?
      directory = directory.joins(:directory_second_categories)
                  .where("directory_second_categories.second_category_id=?",self.second_category_id)
    end
    directory = directory.where(prefecture_id: self.prefecture_id) if self.prefecture_id.present?
    directory = directory.where(city_id: self.city_id) if self.city_id.present?
    directory = directory.where("name like ?", "%#{self.name}%") if self.name.present?  
    directory
  end
end
