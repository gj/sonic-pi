# OPENING SYNTH
in_thread do
  melody_patterns = [[[:C5], 1, 4], [[:E5, :C5], 0.5, 4], [[:D5], 1, 7], [[:E5, :G5], 0.5, 1]]
  melody_order = [[[0, 1, 0, 1, 2, 3], 5, 484], [[0, 1, 0, 1, 2, 3], 6], [[0, 1, 0, 1]]]
  melody_order.each do |p, r = 1, s = 0|
    r.times do
      p.each do |index|
        melody_patterns[index].last.times do
          melody_patterns[index].first.each do |note|
            play_pattern_timed [note], [melody_patterns[index].at(1)]
          end
        end
      end
    end
    sleep s
  end
end
