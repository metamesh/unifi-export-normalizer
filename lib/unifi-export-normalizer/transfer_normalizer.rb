module UnifiNormalizer
  module TransferNormalizer
    def self.normalize transfer
      match_data = /(\d*.?\d*) ([TGMK]?B)/.match transfer
      quantity = Float(match_data[1])
      units = match_data[2]

      convert_to_megabytes(quantity, units).to_s
    end

    def self.convert_to_megabytes quantity, units
      case units
      when 'TB'
        quantity * 1024.0 * 1024.0
      when 'GB'
        quantity * 1024.0
      when 'MB'
        quantity
      when 'KB'
        quantity / 1024.0
      end
    end
  end
end
