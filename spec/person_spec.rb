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
end
