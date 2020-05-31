class Author
  attr_reader :name, :bio

  def initialize(args)
    @name = args[:name]
    @bio = args[:bio]
    rescue TypeError
      @name = @bio = nil
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
