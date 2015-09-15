class Person
  attr_accessor :name, :email, :zip

  def initialize(name)
    self.name = name
  end

  def say_hi
    puts "Hello my name is #{name}!"
  end

  def method_missing(method, *args)
    if method.to_s =~ /^say_/
      puts method.to_s.sub(/^say_/, '').gsub('_', ' ')
    else
      super
    end
  end
end









