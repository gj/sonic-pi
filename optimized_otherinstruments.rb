# -==---====-----======-------========---------========== Opening Synth
in_thread do
  5.times do
    play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:D5, :D5, :D5, :D5, :D5, :D5, :D5, :E5, :G5], [1, 1, 1, 1, 1, 1, 1, 0.5, 0.5], amp: 0.4
  end
  sleep 484       # Measures 31-151
  6.times do
    play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:D5, :D5, :D5, :D5, :D5, :D5, :D5, :E5, :G5], [1, 1, 1, 1, 1, 1, 1, 0.5, 0.5], amp: 0.4
  end
  play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
  play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
end

# -==---====-----======-------========---------========== Background Whiny Synth
in_thread do
  sleep 312
  with_fx :mono, reps: 16 do
    play_pattern [:F5, :G5, :F5, :E5], attack: 1.2, release: 0.1
  end
end

# -==---====-----======-------========---------========== Chords
define :chords do |sleep_before, notes, repeat|
  sleep sleep_before
  repeat.times do
    notes.each do |n|
      play_pattern_timed n, [0, 0, 0, 8], sustain: 8
    end
  end
end

in_thread do
  use_synth :saw
  use_synth_defaults amp: 0.25
  chords(248, [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 2)    # Measures   1-78
  chords(64,  [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 2)    # Measures  79-110
  chords(100, [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 5)    # Measures 111-175
  chords(0,   [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3]],                                              1)    # Measures 176-179
end

# -==---====-----======-------========---------========== Piano
define :piano1 do |pause|
  play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 4], amp: 0.8, attack: 0.1
  sleep pause
end

in_thread do
  use_synth :piano
  sleep 184                    # Measures 1-46
  2.times do                   # Measures 47-78, 79-110
    piano1(0)
    play_pattern_timed [:G4, :F4, :F4], [0.5, 7.5, 1], amp: 0.8, attack: 0.1
    piano1(0)
    play_pattern_timed [:G4, :F4], [0.5, 7.5], amp: 0.8, attack: 0.1
    sleep 65
  end
  sleep 48                     # Measures 111-122
  piano1(1)                  # Measures 123-134
  piano1(1)
end

# -==---====-----======-------========---------========== Guitar
in_thread do
  use_synth :fm
  use_synth_defaults sustain: 0.35, release: 0.1
  sleep 440.5
  with_fx :distortion, distort: 0.8, pre_amp: 10, amp: 0.3 do
    with_fx :bitcrusher, cutoff: 120, reps: 4 do
      play_pattern_timed [:F3, :F4, :F4, :F4, :F4, :F4, :F4, :F4, :F4, :E4, :F3, :E4, :E4, :E4, :E4, :E4, :E4, :F4, :E4, :D4, :F3, :D4, :D4, :D4, :D4, :D4, :D4, :C4, :C4, :C4], [0.5, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1]
    end
  end
end
