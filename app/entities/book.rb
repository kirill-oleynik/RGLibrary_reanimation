# frozen_string_literal: true

require_relative 'helper_methods.rb'
# Book entity
class Book
  include HelperMethods
  attr_accessor :title
  attr_writer :author
  def initialize(args = {})
    @title = args[:title]
    @author = args[:author]
  end

  def to_s
    return valid? ? "'#{title}' by #{author}" : nil
  end

  def author
    return author_valid? ? @author.to_s : nil
  end

  def valid?
    return title_valid? && author_valid?
  end

  private

  def title_valid?
    return not_empty_string?(@title)
  end

  def author_valid?
    return @author.is_a?(Author) && @author.valid?
  end
end
