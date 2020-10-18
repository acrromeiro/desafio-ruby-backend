class BusinessException < Exception
  attr_reader :code

  def initialize(msg, code)
    @code = code
    super(msg)
  end
end
