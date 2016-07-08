use_bpm 175

# EIGHTH NOTES
define :eighths_method do |n|
  play_pattern_timed [n, :C5, n, n, :C5, n, n, :C5, n, :C5, n, n, :C5, n], [0.5]
  if (n == :F4)
    play_pattern_timed [:C5, n], [0.5]
  else
    play_pattern_timed [n, :C5], [0.5]
  end
end

live_loop :eighths do
  eighths_method(:F4)
  eighths_method(:E4)
end

# OPENING MELODY
define :melody_method do |notes, sleeps, repeat|
  repeat.times do
    play_pattern_timed notes, sleeps
  end
end

live_loop :melody do
  2.times do
    melody_method([:C5], [1], 4)
    melody_method([:E5, :C5], [0.5], 4)
  end
  melody_method([:D5], [1], 7)
  melody_method([:E5, :G5], [0.5], 1)
end
