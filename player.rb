require './actor.rb'

class Player < Actor
  attr_accessor :name, :age, :stats

  def initialize(name, age, stats={})
    if stats.empty?
      @stats = {
        level: 1,
        money: 100,
        current_hp: 15,
        total_hp: 15,
        atk: 10,
        def: 10
      }
    else
      @stats = {
        level: stats[:level],
        money: stats[:money],
        current_hp: stats[:current_hp],
        total_hp: stats[:total_hp],
        atk: stats[:atk],
        def: stats[:def]
      }
    end
    @name = name
    @age = age
  end

  ### BATTLE STUFF ###
  def attack(enemy)
    difference = (stats[:atk] - enemy.stats[:def])
    if difference > 5
      hit = rand(2..(difference * 2)) + 2
      enemy.stats[:current_hp] -= hit
      puts "// Hit #{enemy.name} for #{hit}!"
      puts "// #{enemy.name} now has #{enemy.stats[:current_hp]} HP"
    elsif difference > 0
      hit = rand(1..(difference)) + rand(1..2)
      enemy.stats[:current_hp] -= hit
      puts "Hit #{enemy.name} for #{hit}!"
      puts "#{enemy.name} now has #{enemy.stats[:current_hp]} HP"
    elsif difference == 0
      hit = rand(0..2)
      enemy.stats[:current_hp] -= hit
      puts "Hit #{enemy.name} for #{hit}!"
      puts "#{enemy.name} now has #{enemy.stats[:current_hp]} HP"
    else
      puts "You can not hit this monster! Best to run away."
    end
  end

  def train
    puts "Would you like to train attack or defense?"
    puts "(Enter 'attack' or 'defense')"
    answer = gets.chomp.downcase

    if answer == "attack"
      puts "How long do you want to train for?"
      puts "(in minutes, at least 2 to gain skill)"
      time = gets.chomp.to_i
      cost = time * 2
      puts "Training for #{time} minutes will cost $#{cost}."
      puts "Do you still want to train? (y/n)"
      response = gets.chomp.downcase
      if response == 'y'
        if cost <= stats[:money]
          puts "Okay, training attack for #{time} minutes."
          gain = (time / 2)
          stats[:atk] += gain
          stats[:money] -= cost
          puts "You have gained #{gain} attack skill points."
          puts "You now have #{stats[:atk]} attack skill."
        else
          puts 'You need more money to use the training facility.'
        end
      elsif response == 'n'
        puts 'Leaving the training facility...'
      else
        puts 'Command not recognized.'
      end
    end

  end
end
