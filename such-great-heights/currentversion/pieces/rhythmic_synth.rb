# RHYTHMIC SYNTH
eighths_patterns = [[:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4],
                    [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5, :E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5],
                    [:D4, :C5, :D4, :D4, :C5, :D4, :D4, :C5, :D4, :C5, :D4, :D4, :C5, :D4, :C5, :D4],
                    [:A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5, :A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5]]

eighths_order = [ [ [0, 1],        7,    0 ] ,
                  [ [0],           1,  128 ] ,
                  [ [0, 1, 2, 3],  2,   64 ] ,
                  [ [0, 1, 2, 3],  2,    0 ] ,
                  [ [0, 1],        6,    4 ] ,
                  [ [0, 1, 2, 3],  2,    0 ] ,
                  [ [0, 1],       10,    0 ] ]

in_thread do
  with_fx :panslicer, phase: 1 do
    eighths_order.each do |patterns_sequence, repeat, sleep_after|
      repeat.times do
        patterns_sequence.each do |index|
          play_pattern_timed eighths_patterns[index], [0.5]
        end
      end
      sleep sleep_after
    end
  end
end
