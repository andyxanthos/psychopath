class Actor

  def list_stats
    puts "|||| Stats for #{name} (age #{age}) ||||"
    puts "// Money: #{stats[:money]}"
    puts "// Level: #{stats[:level]}"
    puts "// HP: #{stats[:current_hp]}/#{stats[:total_hp]}"
    puts "// Attack: #{stats[:atk]}, Defense: #{stats[:def]}"
  end
  
end
