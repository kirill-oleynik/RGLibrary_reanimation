# frozen_string_literal: true

# Book entity
class Book
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
    return @title.is_a?(String) && @title.length > 0
  end

  def author_valid?
    return @author.is_a?(Author) && @author.valid?
  end
end
