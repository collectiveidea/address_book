require 'csv'

class AddressBook

  class InvalidEntry < StandardError
  end

  def initialize
    @entries = []
  end

  def entries
    @entries
  end

  def add(item)
    @entries << item unless @entries.include?(item)
    # @entries |= [item]
  end

  def remove(item)
    if @entries.include?(item)
      @entries.delete(item)
    else
      raise InvalidEntry, "that item is not in the list of entries"
    end
  end

  def export(filename)
    CSV.open(filename, 'w+') do |csv|
      csv << ["Name", "Email", "Zip"]
      @entries.each do |entry|
        csv << [entry.name, entry.email, entry.zip]
      end
    end
  end

  def import(filename)
    CSV.foreach(filename, headers: true) do |row|
      person = Person.new(row["Name"])
      person.email = row["Email"]
      person.zip = row["Zip"]
      add(person)
    end
  end
end



