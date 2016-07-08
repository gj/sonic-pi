use_bpm 175

patterns = [ [ :F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4 ] , # F-pattern
             [ :E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5, :E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5 ] , # E-pattern
             [ :D4, :C5, :D4, :D4, :C5, :D4, :D4, :C5, :D4, :C5, :D4, :D4, :C5, :D4, :C5, :D4 ] , # D-pattern
             [ :A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5, :A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5 ] ] # A-pattern

order = [ [ [ 0, 1 ],         7,    0 ] ,
          [ [ 0 ],            1,  128 ] ,
          [ [ 0, 1, 2, 3 ],   2,   64 ] ,
          [ [ 0, 1, 2, 3 ],   2,    0 ] ,
          [ [ 0, 1 ],         6,    4 ] ,
          [ [ 0, 1, 2, 3 ],   2,    0 ] ,
          [ [ 0, 1 ],        10,    0 ] ]

puts "Follow along as the method is continuously\n    updated according to its current parameters:\n"
order.each do |patterns_sequence, repeat, sleep_after|
  puts "order.each do |#{patterns_sequence}, #{repeat}, #{sleep_after}|\n        #{repeat}.times do"
  repeat_counter = 1
  repeat.times do
    unless repeat_counter == 1
      puts "    (Repetition #{repeat_counter})"
    end
    patterns_sequence.each do |index|
      puts "        #{patterns_sequence}.each do |#{index}|\n                play_pattern_timed patterns[#{index}], [0.5]\n            end"
      if index == patterns_sequence[-1]
        puts "    end"
        unless repeat == 1
          if sleep_after == 0
            if repeat_counter == repeat
              puts "end"
            end
          end
        end
      end
      play_pattern_timed patterns[index], [0.5]
    end
    repeat_counter += 1
  end
  unless sleep_after == 0
    puts "    sleep #{sleep_after}\n    end"
  end
  sleep sleep_after
  unless repeat == 10
    puts "Now it's time to iterate order.each\n    and update our three parameters:\n"
  end
end
