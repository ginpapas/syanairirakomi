class Search::Base
  include ActiveModel::Model

  def parse_datetime_field(target_attributes, params)
    return unless params.present?
    target_attributes.each do |attribute|
      parts = (1..5).map { |e| params["#{attribute}(#{e}i)"].to_i }
      parts = parts.slice(0, parts.rindex { |e| e != 0 }.to_i + 1)
      return nil if parts[0] == 0
      self.send("#{attribute}=", DateTime.new(*parts))
    end
  end
end
