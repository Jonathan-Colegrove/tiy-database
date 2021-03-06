# future updates:  add case-insensitive search feature
class Person
  attr_accessor :name, :phone, :address, :position, :salary, :slack, :github
end

class Functions
  def initialize
    @database = []
  end

  def home
    loop do
      puts "What would you like to do?
            A = Add a person
            S = Search for a person
            D = Delete a person

            L = leave"
      action = gets.chomp!

      case action
        when "A"
          add
        when "S"
          search
        when "D"
          delete
        when "L"
          puts "Have a great day!"
          return
        else
          puts "Please type \"A\", \"S\", \"D\", or \"L\" without quotes"
      end
    end
  end

  def add
    person = Person.new

    puts "Please enter person's name"
    person.name = gets.chomp!

    if person.name.empty?
      puts "Sorry, User cannot be created without a name."
      return
    end

    puts "Please enter person's phone #"
    person.phone = gets.chomp!

    puts "Please enter person's address"
    person.address = gets.chomp!

    puts "What's the person's position? (example: Instructor, Student, TA, etc)"
    person.position = gets.chomp!

    puts "What's the person's salary (in US$)?"
    person.salary = gets.chomp.to_i

    puts "What's the person's Slack Account?"
    person.slack = gets.chomp!

    puts "What's the person's Github Account?"
    person.github = gets.chomp!

    puts "Thanks so much!  #{person.name} is now added."

    @database << person
  end

  def search
    puts "Sure!  What's the person's name?"
    search_name = gets.chomp!

    for person in @database
      if person.name == search_name
        puts "User is listed:
              #{person.name}
              Phone: #{person.phone}
              Address: #{person.address}
              #{person.position}
              Salary = $#{person.salary}
              Slack ID = #{person.slack}
              Github ID = #{person.github}"
        return
      end
    end

    puts "Sorry, #{search_name} isn't in our database.
          Have them add their details to become searchable."
  end

  def delete
    puts "Deleting a User can't be undone.
          Yes to continue, No to stop."
    delete_answer = gets.chomp.downcase
    if delete_answer == "yes"
      puts "Ok, what's the person's name?"
      delete_name = gets.chomp!
      for person in @database
        if person.name == delete_name
          puts "#{person.name} & all their info. has been deleted."
          @database.delete(person)
          return
        end
      end

      puts "Looks like you're 1 step ahead of us! #{delete_name} isn't in our database."
    end
  end
end

functions = Functions.new
functions.home
