# frozen_string_literal: true

# An author of a book
class Author
  attr_accessor :name, :bio
  def initialize(args = {})
    @name = args[:name]
    @name = args[:bio]
  end

  def valid?
    return name_is_valid?
  end

  def to_s
    name.to_s
  end

  private

  def name_is_valid?
    return name.is_a?(String) && name.length > 0
  end
end
