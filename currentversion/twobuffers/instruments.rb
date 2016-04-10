# INSTRUMENTS - Place in its own buffer - RUN SECOND
use_bpm 175
cue :drums

# VOCALS (KIND OF)
define :bassvox do |notes, repeat|
  with_fx :lpf, reps: repeat do
    notes.each do |n, t, r| # |notes, time in between notes, repetitions|
      r.times do
        play_pattern_timed n, t
      end
    end
  end
end
in_thread do
  use_synth :piano
  with_fx :reverb, amp: 1.75, mix: 0.4, room: 0.6, damp: 0.99 do |verb|
    sleep 120
    bassvox([[[:F4, :C4], [3.5, 0.5], 1], [[:F4], [1], 3], [[:G4, :E4, :C4, :C4, :E4, :E4, :E4, :F4, :D4, :C4, :Bb3, :Bb3, :Bb3], [0.5, 3.5, 0.5, 0.5, 0.5, 1, 1, 1, 1.5, 1, 1, 1, 0.5], 1], [[:Bb3, :Bb3, :Bb3, :Bb3], [1, 1, 1.5, 0.5], 2], [[:A3, :G3], [1.5, 1], 1]], 1)
    bassvox([[[:F3, :F3, :F4], [1, 0, 4], 1], [[:F4], [1], 3], [[:G4, :E4, :C4, :C4, :E4, :E4, :E4, :F4, :D4, :C4, :Bb3, :Bb3, :Bb3], [0.5, 3.5, 0.5, 0.5, 0.5, 1, 1, 1, 1.5, 1, 1, 1, 0.5], 1], [[:Bb3, :Bb3, :Bb3, :Bb3], [1, 1, 1.5, 0.5], 2], [[:A3, :G3, :F3, :F3], [1.5, 1, 1, 0], 1]], 1)
    2.times do
      bassvox([[[:F4], [4], 1], [[:F4], [1], 3], [[:G4, :E4, :C4, :C4, :E4, :E4, :E4, :F4, :D4, :C4, :Bb3, :Bb3, :Bb3], [0.5, 3.5, 0.5, 0.5, 0.5, 1, 1, 1, 1.5, 1, 1, 1, 0.5], 1], [[:Bb3, :Bb3, :Bb3, :Bb3], [1, 1, 1.5, 0.5], 2], [[:A3, :G3], [1.5, 1], 1]], 1)
      bassvox([[[:F3, :C4, :F4, :C4], [0, 1, 3.5, 0.5], 1], [[:F4], [1], 3], [[:G4, :E4, :C4, :C4, :E4, :E4, :E4, :F4, :D4, :C4, :Bb3, :Bb3, :Bb3], [0.5, 3.5, 0.5, 0.5, 0.5, 1, 1, 1, 1.5, 1, 1, 1, 0.5], 1], [[:Bb3, :Bb3, :Bb3, :Bb3], [1, 1, 1.5, 0.5], 2], [[:A3, :G3, :F3], [1.5, 1, 1], 1]], 1)
      with_synth :fm do
        bassvox([[[:C5], [1], 5], [[:A4, :C5], [1], 1], [[:D5, :C5, :C5, :D5, :F5], [2], 1], [[:Bb4, :Bb4, :A4, :F4], [5, 2, 7, 1], 1]], 1)
        bassvox([[[:C5], [1], 5], [[:A4, :C5], [1], 1], [[:D5, :C5, :C5, :D5, :F5], [2], 1], [[:Bb4, :Bb4, :D5, :A4, :G4, :F4], [4, 2, 2, 2, 1, 4], 1]], 1)
      end
    end
    sleep 100
    with_synth :fm do
      2.times do
        bassvox([[[:C5], [1], 5], [[:A4, :C5], [1], 1], [[:D5, :C5, :C5, :D5, :F5], [2], 1], [[:Bb4, :Bb4, :A4, :F4], [5, 2, 7, 1], 1]], 1)
        bassvox([[[:C5], [1], 5], [[:A4, :C5], [1], 1], [[:D5, :C5, :C5, :D5, :F5], [2], 1], [[:Bb4, :Bb4, :D5, :A4, :G4, :F4, :F4], [4, 2, 2, 2, 1, 3, 1], 1]], 1)
      end
      bassvox([[[:C5], [1], 5], [[:A4, :C5], [1], 1], [[:D5, :C5, :C5, :D5, :F5], [2], 1], [[:Bb4], [15], 1]], 1)
      control verb, amp: 1.5, mix: 0.7, room: 0.75, damp: 0.9
      bassvox([[[:C5, :C5, :C5], [2, 1], 1], [[:A4, :C5, :C5, :C5, :F5, :Bb4], [1, 3, 2, 4, 2, 3], 1]], 1)
    end
  end
end

# EIGHTH NOTES
define :eighths do |notes, repeat, sleep_after|
  repeat.times do
    notes.each do |updown, n|
      play_pattern_timed [n, :C5, n, n, :C5, n, n, :C5], [0.5]
      if updown == 1 # If updown == 1, play low-high ending
        play_pattern_timed [n, :C5, n, n, :C5, n, n, :C5], [0.5]
      else # If updown != 1, play high-low ending
        play_pattern_timed [n, :C5, n, n, :C5, n, :C5, n], [0.5]
      end
    end
  end
  sleep sleep_after
end
in_thread do
  with_fx :panslicer, phase: 1 do
    eighths([[0, :F4], [1, :E4]], 7, 0)
    eighths([[0, :F4]], 1, 128)
    eighths([[0, :F4], [1, :E4], [0, :D4], [1, :A4]], 2, 64)
    eighths([[0, :F4], [1, :E4], [0, :D4], [1, :A4]], 2, 0)
    eighths([[0, :F4], [1, :E4]], 6, 4)
    eighths([[0, :F4], [1, :E4], [0, :D4], [1, :A4]], 2, 0)
    eighths([[0, :F4], [1, :E4]], 10, 0)
  end
end

# OPENING SYNTH
in_thread do
  5.times do
    play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:D5, :D5, :D5, :D5, :D5, :D5, :D5, :E5, :G5], [1, 1, 1, 1, 1, 1, 1, 0.5, 0.5], amp: 0.4
  end
  sleep 484
  6.times do
    play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
    play_pattern_timed [:D5, :D5, :D5, :D5, :D5, :D5, :D5, :E5, :G5], [1, 1, 1, 1, 1, 1, 1, 0.5, 0.5], amp: 0.4
  end
  play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
  play_pattern_timed [:C5, :C5, :C5, :C5, :E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], amp: 0.4
end

# BACKGROUND SYNTH
in_thread do
  sleep 312
  with_fx :mono, reps: 16 do
    play_pattern [:F5, :G5, :F5, :E5], attack: 1.2, release: 0.1
  end
end

# BACKGROUND CHORDS
define :chords do |sleep_before, notes, repeat|
  sleep sleep_before
  repeat.times do
    notes.each do |n|
      play_pattern_timed n, [0, 0, 0, 8], sustain: 8, amp: 0.175
    end
  end
end
in_thread do
  use_synth :saw
  chords(248, [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 2)
  chords(64,  [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 2)
  chords(100, [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 5)
  chords(0,   [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3]], 1)
end

# BASS LINE
in_thread do
  use_synth :tb303
  use_synth_defaults amp: 0.9, env_curve: 7, res: 0, sustain: 0.98, release: 0.02, cutoff: 80
  sleep 64
  bassvox([[[:F1], [1], 8], [[:A1], [1], 8], [[:G1], [1], 8], [[:F1], [1], 8],  [[:A1], [1], 8], [[:G1], [1], 16]], 1)
  bassvox([[[:F1], [1], 8], [[:A1], [1], 8], [[:G1], [1], 8], [[:Bb1], [1], 4], [[:C2], [1], 4]], 2)
  2.times do
    bassvox([[[:F1], [1], 8], [[:A1], [1], 8], [[:G1], [1], 8], [[:Bb1], [1], 4], [[:C2],  [1], 4], [[:F1], [1], 8], [[:A1], [1], 8],  [[:G1], [1], 8], [[:C2], [1], 4], [[:Bb1], [1], 4]],  1)
    bassvox([[[:F1], [1], 6], [[:A1], [1], 1], [[:B1], [1], 1], [[:C2], [1], 8],  [[:Bb1], [1], 8], [[:A1], [1], 8]], 2)
  end
  bassvox([[[:F1], [1], 8], [[:A1], [1], 8], [[:G1], [1], 8]], 4)
  bassvox([[[:Bb1], [1], 4]], 1)
  bassvox([[[:F1], [1], 6], [[:A1], [1], 1], [[:B1], [1], 1], [[:C2], [1], 8], [[:Bb1], [1], 8], [[:A1], [1], 8]], 4)
  bassvox([[[:F1], [1], 6], [[:A1], [1], 1], [[:B1], [1], 1], [[:C2], [1], 5], [[:D2],  [1], 2], [[:F2], [1], 2], [[:Bb1], [1], 7], [[:A1], [1], 8]], 3)
end

# SECONDARY PIANO
in_thread do
  use_synth :piano
  sleep 184
  with_fx :reverb, reps: 2, mix: 0.5, room: 0.7, damp: 0.9 do
    play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4, :G4, :F4, :F4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 4, 0.5, 7.5, 1], amp: 0.8, attack: 0.1
    play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4, :G4, :F4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 4, 0.5, 72.5], amp: 0.8, attack: 0.1
  end
  sleep 48
  play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4], [1, 1, 1, 5], amp: 0.8, attack: 0.1
  play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4], [1, 1, 1, 5], amp: 0.8, attack: 0.1
end

# GUITAR RIFF
in_thread do
  use_synth :fm
  use_synth_defaults sustain: 0.35, release: 0.1
  sleep 440.5
  with_fx :distortion, distort: 0.8, pre_amp: 10, amp: 0.125 do
    with_fx :bitcrusher, cutoff: 120, reps: 4 do
      play_pattern_timed [:F3, :F4, :F4, :F4, :F4, :F4, :F4, :F4, :F4, :E4, :F3, :E4, :E4, :E4, :E4, :E4, :E4, :F4, :E4, :D4, :F3, :D4, :D4, :D4, :D4, :D4, :D4, :C4, :C4, :C4], [0.5, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1]
    end
  end
end
