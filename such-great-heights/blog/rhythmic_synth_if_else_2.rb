use_bpm 175

define :eighths_method do |notes|
  notes.each do |n|
    play_pattern_timed [n, :C5, n, n, :C5, n, n, :C5, n, :C5, n, n, :C5, n], [0.5]
    if (n == :F4 || n == :D4)
      play_pattern_timed [:C5, n], [0.5]
    else
      play_pattern_timed [n, :C5], [0.5]
    end
  end
end

live_loop :eighths do
  eighths_method([:F4, :E4, :D4, :A4])
end
