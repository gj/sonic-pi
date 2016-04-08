# Pared down version of Such Great Heights
use_bpm 175
# -==---====-----======-------========---------========== Drums
define :drum_loop do
  sample :bd_ada
  sleep 0.5
  sample :drum_cymbal_pedal, sustain: 0.1, amp: 0.75
  sleep 0.5
  sample :sn_dolf, sustain: 0.1
  sleep 0.5
  sample :drum_cymbal_pedal, sustain: 0.1, amp: 0.75
  sleep 0.5
end
in_thread do
  sleep 64
  with_fx :ixi_techno, mix: 1, phase: 112, res: 0 do |filter|
    28.times do
      drum_loop
    end
    control filter, mix: 0
    208.times do
      drum_loop
    end
    sleep 4
    96.times do
      drum_loop
end end end
# -==---====-----======-------========---------========== Panning Eighth Notes
define :eighths do |n1, n2|
  play_pattern_timed [n1, :C5, n1, n1, :C5, n1, n1, :C5, n1, :C5, n1, n1, :C5, n1, :C5, n1], [0.5]
  play_pattern_timed [n2, :C5, n2, n2, :C5, n2, n2, :C5, n2, :C5, n2, n2, :C5, n2, :C5, n2], [0.5]
end
in_thread do
  with_fx :panslicer, phase: 1 do
    7.times do
      eighths(:F4, :E4)
    end
    play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4], [0.5]
    sleep 64
    2.times do
      sleep 64
      2.times do
        eighths(:F4, :E4)
        eighths(:D4, :A4)
    end end
    6.times do
      eighths(:F4, :E4)
    end
    sleep 4
    2.times do
      eighths(:F4, :E4)
      eighths(:D4, :A4)
    end
    10.times do
      eighths(:F4, :E4)
end end end
# -==---====-----======-------========---------========== Chords
in_thread do
  use_synth :saw
  use_synth_defaults amp: 0.25
  sleep 248    # Measures 1-62
  2.times do   # Measures 63-78, 95-110
    play_pattern_timed [:C4, :A3, :F3, :C3, :C4, :G3, :E3, :C3, :D4, :Bb3, :F3, :D3, :A3, :F3, :C3, :A3], [0, 0, 0, 8], sustain: 8
    play_pattern_timed [:C4, :A3, :F3, :C3, :C4, :G3, :E3, :C3, :D4, :Bb3, :F3, :D3, :A3, :F3, :C3, :A3], [0, 0, 0, 8], sustain: 8
    sleep 64   # Measures 79-94, 111-126
  end
  sleep 36     # Measures 127-135
  5.times do   # Measures 136-175
    play_pattern_timed [:C4, :A3, :F3, :C3, :C4, :G3, :E3, :C3, :D4, :Bb3, :F3, :D3, :A3, :F3, :C3, :A3], [0, 0, 0, 8], sustain: 8
  end
  play_pattern_timed [:C4, :A3, :F3, :C3, :C4, :G3, :E3, :C3], [0, 0, 0, 8], sustain: 8
end            # ^^^ Measures 176-179 ^^^
# -==---====-----======-------========---------========== Whiny Synth Thing
in_thread do
  sleep 312
  with_fx :mono, reps: 16 do
    play_pattern [:F5, :G5, :F5, :E5], attack: 1.2, release: 0.1
end end
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
# -==---====-----======-------========---------========== Bass Line
in_thread do
  use_synth :tb303
  use_synth_defaults amp: 1, env_curve: 7, res: 0, sustain: 0.875, release: 0.05
  sleep 64                                                                 # Measures 1-16
  with_fx :nlpf, amp: 0.3, cutoff: 80 do
    with_fx :echo, phase: 1, decay: 4.2, max_phase: 1 do
      play_pattern_timed [:F1, :A1, :G1, :F1, :A1, :G1, :G1], [8]          # Measures 17-30
      5.times do
        play_pattern_timed [:F1, :A1, :G1, :Bb1, :C2], [8, 8, 8, 4, 4]     # Measures 47-54, 79-86
        play_pattern_timed [:F1, :A1, :G1, :C2, :Bb1], [8, 8, 8, 4, 4]     # Measures 55-62, 87-94
      end
      4.times do
        play_pattern_timed [:F1, :A1, :G1], [8]                            # Measures 111-134
    end end
    play_pattern_timed [:Bb1], [4], sustain: 4                             # Measure 135
    7.times do                                                             # Measures 168-191
      play_pattern [:F1, :F1, :F1, :F1, :F1, :F1, :A1, :B1, :C2, :C2, :C2, :C2, :C2, :D2, :D2, :F2, :F2, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :A1, :A1, :A1, :A1, :A1, :A1, :A1, :A1]
end end end
# -==---====-----======-------========---------========== Piano
in_thread do
  use_synth :piano
  with_fx :reverb, mix: 0.3, room: 0.7, damp: 0.9 do
    sleep 184     # Measures 1-46
    play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4, :G4, :F4, :F4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 4, 0.5, 7.5, 1]
    play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4, :G4, :F4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 4, 0.5, 7.5]
    sleep 65
    play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4, :G4, :F4, :F4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 4, 0.5, 7.5, 1]
    play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4, :G4, :F4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 4, 0.5, 7.5]
    sleep 113
    play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 5]
    play_pattern_timed [:C5, :E5, :F5, :C5, :C5, :E5, :G5, :C5, :Bb4, :A4, :C5, :G4], [1, 1, 1, 5, 1, 1, 1, 5, 1, 1, 1, 5]
end end
# -==---====-----======-------========---------========== Guitar
in_thread do
  use_synth :fm
  sleep 440.5
  with_fx :distortion, distort: 0.9, pre_amp: 10, amp: 0.3 do
    with_fx :bitcrusher, cutoff: 120, reps: 4 do
      play_pattern_timed [:F3, :F4, :F4, :F4, :F4, :F4, :F4, :F4, :F4, :E4, :F3, :E4, :E4, :E4, :E4, :E4, :E4, :F4, :E4, :D4, :F3, :D4, :D4, :D4, :D4, :D4, :D4, :C4, :C4, :C4], [0.5, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1], sustain: 0.35, release: 0.1
end end end
# -==---====-----======-------========---------========== Vocals (Close enough!)
define :vocals1 do 2.times do play_pattern_timed [:F4, :F4, :F4, :F4, :G4, :E4, :C4, :C4, :E4, :E4, :E4, :F4, :D4, :C4, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :A3, :G3, :F3], [4, 1, 1, 1, 0.5, 3.5, 0.5, 0.5, 0.5, 1, 1, 1, 1.5, 1, 1, 1, 0.5, 1, 1, 1.5, 0.5, 1, 1, 1.5, 0.5, 1.5, 1, 1], amp: 2 end end
define :vocals2 do play_pattern_timed [:C5, :C5, :C5, :C5, :C5, :A4, :C5, :D5, :C5, :C5, :D5, :F5, :Bb4, :Bb4, :A4, :F4, :C5, :C5, :C5, :C5, :C5, :A4, :C5, :D5, :C5, :C5, :D5, :F5, :Bb4, :Bb4, :D5, :A4, :G4, :F4, :F4], [1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 5, 2, 7, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 4, 2, 2, 2, 1, 3, 1], amp: 1 end
in_thread do
  use_synth :piano
  with_fx :reverb, mix: 0.5, room: 0.75, damp: 0.9 do
    sleep 120                         # Measures 1-30
    vocals1
    2.times do
      vocals1
      with_synth :fm do vocals2 end   # Measures 63, 95
    end
    sleep 100                         # Measures 111-135
    with_synth :fm do
      2.times do vocals2 end
      # play_pattern_timed [:C5, :C5, :C5, :C5, :C5, :A4, :C5, :D5, :C5, :C5, :D5, :F5, :Bb4, :C4, :C4, :C4, :A3, :C4, :C4, :C4, :F4, :Bb3], [1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 15, 2, 1, 2, 1, 3, 2, 4, 2, 3]
end end end
