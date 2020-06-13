# frozen_string_literal: true

require 'time'
# order entity
class Order
  attr_writer :book, :reader, :date

  def initialize(args = {})
    @book = args[:book]
    @reader = args[:reader]
    @date = args[:date] || Date.today
  end

  def valid?
    return [
      book_valid?,
      reader_valid?,
      date_valid?
    ].all?
  end

  def book
    return book_valid? ? @book.to_s : nil
  end

  def reader
    return @reader && @reader.is_a?(Reader) && @reader.valid? ? @reader.to_s : nil
  end

  def date
    return @date.is_a?(Date) ? @date.strftime('%d-%m-%Y') : nil
  end

  def ==(other)
    is_valid_order = other.is_a?(Order) && other.valid?
    return is_valid_order ? book == other.book && reader == other.reader && date == other.date : false
  end

  private

  def book_valid?
    return @book.is_a?(Book) && @book.valid?
  end

  def reader_valid?
    return @reader.is_a?(Reader) && @reader.valid?
  end

  def date_valid?
    return @date.is_a?(Date)
  end
end
