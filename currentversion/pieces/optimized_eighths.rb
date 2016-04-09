# -==---====-----======-------========---------========== Panning Eighth Notes
define :eighths do |notes, repeat, sleep_after|
  repeat.times do
    notes.each do |updown, n|
      play_pattern_timed [n, :C5, n, n, :C5, n, n, :C5], [0.5]
      if updown == 1    # If updown == 1, play low-high ending
        play_pattern_timed [n, :C5, n, n, :C5, n, n, :C5], [0.5]
      else              # If updown != 1, play high-low ending
        play_pattern_timed [n, :C5, n, n, :C5, n, :C5, n], [0.5]
      end
    end
  end
  sleep sleep_after
end

in_thread do
  with_fx :panslicer, phase: 1 do
    eighths([[0, :F4], [1, :E4]], 7, 0)                         # Measures   1-28
    eighths([[0, :F4]], 1, 128)                                 # Measures  29-62
    eighths([[0, :F4], [1, :E4], [0, :D4], [1, :A4]], 2, 64)    # Measures  63-94
    eighths([[0, :F4], [1, :E4], [0, :D4], [1, :A4]], 2, 0)     # Measures  95-110
    eighths([[0, :F4], [1, :E4]], 6, 4)                         # Measures 111-135
    eighths([[0, :F4], [1, :E4], [0, :D4], [1, :A4]], 2, 0)     # Measures 136-151
    eighths([[0, :F4], [1, :E4]], 10, 0)                        # Measures 152-191
  end
end
