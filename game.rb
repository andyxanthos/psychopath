require './enemy.rb'
require './player.rb'

class Game
  def welcome_loop
    puts '/// PSYCHO /// PATH ///'
    puts '/// BY /// ANDY /// X /'
    puts ' '
    puts 'type "new" or "load" to get started'
    response = gets.chomp.downcase
    case response
      when 'new'
        new_game
      when 'load'
        load_game
      else
        puts "Command not recognized."
        welcome_loop
    end
  end

  def new_game
    puts "// Tell me your name, now."
    puts "(Enter your name below.)"
    name = gets.chomp
    puts "// Think you're tough, #{name}? Heh. How old are you?"
    age = gets.chomp
    puts "// I ain't believing that for a second."
    puts "// Good luck out there, kiddo."
    p = Player.new(name, age)
    save_game(p)
    game_loop(p)
  end

  # RETURNS TRUE IF SAVE FILE EXISTS
  def check_for_save
    dir = Dir.open("./saves")
    if dir.entries.include? "save.rb"
      true
    else
      false
    end
  end

  def save_game(player)
    if check_for_save
      File.delete("./saves/save.rb")
    end
    save_file = File.new("./saves/save.rb", "w")
    save_file << player.name + "\n"
    save_file << player.age + "\n"
    player.stats.each do |k, v|
      save_file << "#{k}: #{v}\n"
    end
  end

  def load_game
    if check_for_save
      puts "// Loading saved game...."
      save_file = File.open("./saves/save.rb", "r")
      info = save_file.readlines
      name = info[0][0..-2]
      age = info[1][0..-2]
      stats = {}
      info[2..-1].each do |stat|
        stat = stat[0..-2]
        split = stat.split(": ")
        stats[split[0].to_sym] = split[1]
      end
      p = Player.new(name, age, stats)
      game_loop(p)
    else
      puts "No save file found."
      puts "Starting a new game..."
      puts "//////////"
      new_game
    end
  end

  def game_loop(player)
    puts "Welcome, #{player.name}."
    puts "You are now playing."
    puts "Type 'help' if you're confused"
    loop do
      command = gets.chomp.downcase
      case command

        when 'stats'
          player.list_stats

        when 'exit'
          puts 'Do you want to save your game? (y/n)'
          answer = gets.chomp[0].downcase
          if answer == 'y'
            puts "Saving and quitting..."
            save_game(player)
            break
          elsif answer == 'n'
            puts "Quitting..."
            break
          else
            puts "Command not recognized."
          end

          def train
            player.train
          end

      end
    end
  end

  def battle_loop(player, enemy)
  end
end
