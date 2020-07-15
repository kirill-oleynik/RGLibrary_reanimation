# frozen_string_literal: true

require_relative 'helper_methods.rb'
# An author of a book
class Author
  include HelperMethods
  attr_accessor :name, :bio
  def initialize(args = {})
    @name = args[:name]
    @bio = args[:bio]
  end

  def valid?
    return name_is_valid?
  end

  def to_s
    @name.to_s
  end

  def ==(other)
    is_valid_author = other.is_a?(Author) && other.valid?
    return is_valid_author ? @name == other.name && @bio == other.bio : false
  end

  private

  def name_is_valid?
    return not_empty_string?(@name)
  end
end
