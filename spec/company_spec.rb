require './company'

describe Company do
  it "initializes with a name" do
    company = Company.new("Acme")
    company.name.should == "Acme"
  end

  it "#email" do
    company = Company.new("Acme")
    company.email = "acme@example.com"
    company.email.should == "acme@example.com"
  end
end
