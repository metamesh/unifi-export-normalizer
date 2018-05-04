module UnifiNormalizer
  module DurationNormalizer
    def self.normalize duration
      components = duration.split
      components_in_minutes = components.map { |c| convert_to_minutes c }
      sum_components(components_in_minutes).to_s
    end

    def self.sum_components ary
      ary.inject(0.0, :+)
    end

    def self.convert_to_minutes duration
      match_data = /(\d*)([dhms])/.match duration
      quantity = match_data[1].to_i
      units = match_data[2]

      case units
      when 'd'
        quantity * 60 * 24
      when 'h'
       quantity * 60
      when 'm'
        quantity
      when 's'
        quantity / 60.0
      end
    end
  end
end
