use_bpm 175

define :eighths_method do |n|
  play_pattern_timed [n, :C5, n, n, :C5, n, n, :C5, n, :C5, n, n, :C5, n], [0.5]
  if (n == :F4 || n == :D4)
    play_pattern_timed [:C5, n], [0.5]
  else
    play_pattern_timed [n, :C5], [0.5]
  end
end

live_loop :eighths do
  eighths_method(:F4)
  eighths_method(:E4)
  eighths_method(:D4)
  eighths_method(:A4)
end
