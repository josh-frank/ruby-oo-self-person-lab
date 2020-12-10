# your code goes here
require 'pry'

class Person

    attr_reader :name, :hygiene, :happiness
    attr_accessor :bank_account

    def initialize( this_name )
        @name = this_name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    def happiness=( happy )
        @happiness = happy < 0 ? 0 : happy > 10 ? 10 : happy
        # @happiness = happy.clamp( 0, 10 )
    end

    def hygiene=( hygenic )
        @hygiene = hygenic.clamp( 0, 10 )
    end

    def clean?
        hygiene > 7
    end

    def happy?
        happiness > 7
    end

    def get_paid( salary )
        self.bank_account += salary
        "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness += 2
        self.hygiene -= 3
        "♪ another one bites the dust ♫"
    end

    def call_friend( friend )
        self.happiness += 3
        friend.happiness += 3
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation( friend, topic )
        if ( topic.downcase == "politics" )
            self.happiness -= 2
            friend.happiness -= 2
            return "blah blah partisan blah lobbyist"
        elsif ( topic.downcase == "weather" )
            self.happiness += 1
            friend.happiness += 1
            return "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
    end

end

josh = Person.new( "Josh" )
sylwia = Person.new( "Sylwia" )
hasibul = Person.new( "Hasibul" )
signe = Person.new( "Signe" )

print "Is Josh clean? "
puts josh.clean? ? "Yes" : "No"

print "Is Sylwia happy? "
puts sylwia.happy? ? "Yes" : "No"

hasibul.work_out
print "Is Hasibul clean after working out? "
puts hasibul.clean? ? "Yes" : "No"

print "Signe calls Josh to say: "
puts signe.call_friend( josh )
puts "Now Signe's Happiness is #{signe.happiness} and Josh's happiness is #{josh.happiness}"

print "When Signe calls Hasibul to talk about politics she says: "
puts signe.start_conversation( hasibul, "politics" )
puts "Now Signe's Happiness is #{signe.happiness} and Josh's happiness is #{josh.happiness}"

print "When Josh calls Hasibul to talk about the weather he says: "
puts signe.start_conversation( hasibul, "weather" )
puts "Now Josh's Happiness is #{josh.happiness} and Hasibul's happiness is #{hasibul.happiness}"

print "When Sylwia calls Signe to talk about whatever she says: "
puts sylwia.start_conversation( signe, "whatever" )
puts "Now Sylwia's Happiness is #{sylwia.happiness} and Signe's happiness is #{signe.happiness}"

#binding.pry
#false