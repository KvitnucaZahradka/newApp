class User
  #constructor and data
  attr_accessor :name, :email

  #methods
  def initialize(attributes={})
    @email = attributes[:name]
    @email = attributes[:email]
  end
 
  def formatted_email
    "#{@name} <#{@email}>"
  end
end


