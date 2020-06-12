# frozen_string_literal: true

require_relative 'helper_methods.rb'
# Rader entity
class Reader
  include HelperMethods
  attr_reader :city
  attr_writer :name, :email, :city, :street, :house

  def initialize(args = {})
    @name = args[:name]
    @email = args[:email]
    @city = args[:city]
    @street = args[:street]
    @house = args[:house]
  end

  def valid?
    return [
      name_valid?,
      email_valid?,
      city_valid?,
      street_valid?,
      house_valid?
    ].all?
  end

  def to_s
    return name
  end

  def address
    return address_data_valid? ? "#{@house}, #{@street} str., #{@city}" : nil
  end

  def name
    return name_valid? ? @name : nil
  end

  def email
    return email_valid? ? @email : nil
  end

  def house
    return house_valid? ? @house : nil
  end

  def street
    return street_valid? ? @street : nil
  end

  private

  def address_data_valid?
    return [
      city_valid?,
      street_valid?,
      house_valid?
    ].all?
  end

  def name_valid?
    return not_empty_string?(@name)
  end

  def email_valid?
    return @email && @email&.match(URI::MailTo::EMAIL_REGEXP)
  end

  def city_valid?
    return not_empty_string?(@city)
  end

  def street_valid?
    return not_empty_string?(@street)
  end

  def house_valid?
    return positive_integer?(@house)
  end
end
