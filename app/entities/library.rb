# frozen_string_literal: true

# Contains Library business logic
class Library
  def initialize(repository)
    @repository = repository
  end

  def top_reader(amount = 1)
    return count_of(list_of(:reader)).sort_by { |_key, value| value }.reverse.take(amount).map(&:first)
  end

  def popular_books(amount = 1)
    return count_of(list_of(:book)).sort_by { |_key, value| value }.reverse.take(amount).map(&:first)
  end

  def popular_books_readers(amount = 3)
    reader_book_count_list = count_of(
      @repository.data.map do |order|
        [order.reader, order.book]
      end
    ).sort_by { |_key, value| value }.reverse.take(amount)
    return reader_book_count_list.map { |element| element.dig(0.0, 0) }.count
  end

  private

  def list_of(value)
    return @repository.data.map(&value)
  end

  def count_of(enum)
    return enum.each_with_object(Hash.new(0)) { |value, acc| acc[value] += 1 }
  end
end
