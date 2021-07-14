class PhoneNumber
  FORMAT = /[2-9]\d{2}[2-9]\d{6}/
  CLEAN_REGEXP = /\d/

  def self.clean(string)
    value = string.scan(CLEAN_REGEXP).join

    case value.length
      when 10
          value.scan(FORMAT)[0]
      when 11
          value[1..-1].scan(FORMAT)[0] if value[0] == "1"
      else
        nil
    end
  end
end

