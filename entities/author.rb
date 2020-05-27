class Author
  attr_accessor :name, :bio
  def initialize(args)
    @name = args.fetch(:name, nil)
    @bio = args.fetch(:bio, nil)
    rescue NoMethodError
      @name = @bio = nil
  end
  def valid?
    name
  end
  def valid?
    return name_is_valid?
  end
  private
  def name_is_valid?
    return name.is_a?(String) && name.length > 0
  end
end
