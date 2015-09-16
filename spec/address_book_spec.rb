require './address_book'
require './person'

describe AddressBook do
  before do
    @book = AddressBook.new
    @alice = Person.new("Alice")
  end

  it "has entries" do
    @book.entries.should == []
  end

  it "can add an item" do
    @book.add(@alice)
    @book.entries.should include(@alice)
  end

  it "add ignores duplicates" do
    @book.add(@alice)
    @book.add(@alice)
    @book.entries.size.should == 1
  end

  it "can remove an entry" do
    @book.add(@alice)
    @book.remove(@alice)
    @book.entries.should_not include(@alice)
  end

  it "raises an error when removing something that doesn't exist" do
    lambda { @book.remove(@alice) }.should raise_error(AddressBook::InvalidEntry)
  end

  it "can export" do
    @alice.zip = '10001'
    @alice.email = 'alice@example.com'
    @book.add(@alice)
    @book.export('test.csv')
    File.exist?('test.csv').should be(true)
    File.read('test.csv').should match(/#{@alice.name}/)
  end

  it "can import" do
    @book.import('spec/fixtures/example.csv')
    @book.entries.size.should == 2
    @book.entries.map{|e| e.name }.should include('Bob')
  end
end
