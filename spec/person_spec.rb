require './person'

describe Person do
  it "initializes with a name" do
    person = Person.new("Bob")
    person.name.should == "Bob"
  end

  it "#email" do
    person = Person.new("Bob")
    person.email = "bob@example.com"
    person.email.should == "bob@example.com"
  end

  # def test_weather
#     person = Person.new("Bob")
#     person.zip = '10001'
#     assert_not_nil person.weather
#   end
#
#   def test_weather_without_zip
#     person = Person.new("Bob")
#     assert_equal "Unknown", person.weather
#   end
end
