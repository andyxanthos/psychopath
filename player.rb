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
    puts "Would you like to train offense or defense?"
    puts "(Pick one.)"
    answer = gets.chomp.downcase

  end
end
