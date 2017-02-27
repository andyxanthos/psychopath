require './actor.rb'

class Enemy < Actor
  attr_accessor :name, :age, :type, :stats

  def initialize(name, age, type, options={})
    @stats = {
      level: options[:level],
      money: options[:money],
      current_hp: options[:total_hp],
      total_hp: options[:total_hp],
      atk: options[:atk],
      def: options[:def]
    }
    @name = name
    @type = type
    @age = age
  end
end
