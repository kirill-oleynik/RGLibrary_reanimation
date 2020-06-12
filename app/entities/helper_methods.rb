# frozen_string_literal: true

# Methods that are used by entities
module HelperMethods
  def not_empty_string?(object)
    return object.is_a?(String) && object.length > 0
  end

  def positive_integer?(object)
    return object.is_a?(Integer) && object > 0
  end
end
