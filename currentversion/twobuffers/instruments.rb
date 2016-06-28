# INSTRUMENTS - Place in its own buffer - RUN SECOND
use_bpm 175
cue :drums

# VOCAL SYNTH
vox_patterns = [[[:F5, :C5], [3.5, 0.5]], # Verses
                [[:F5, :F5, :F5, :G5, :E5, :C5, :C5, :E5, :E5, :E5, :F5, :D5, :C5,
                  :Bb4, :Bb4, :Bb4, :Bb4, :Bb4, :Bb4, :Bb4, :Bb4, :Bb4, :Bb4, :Bb4],
                 [1, 1, 1, 0.5, 3.5, 0.5, 0.5, 0.5, 1, 1, 1, 1.5, 1, 1, 1, 0.5, 1, 1, 1.5, 0.5, 1, 1, 1.5, 0.5]],
                [[:A4, :G4], [1.5, 1]],
                [[:F4, :F4, :F5], [1, 0, 4]],
                [[:A4, :G4, :F4, :F4], [1.5, 1, 1, 0]],
                [[:F5], [4]],
                [[:F4, :C5, :F5, :C5], [0, 1, 3.5, 0.5]],
                [[:A4, :G4, :F4], [1.5, 1, 1]],
                [[:C5, :C5, :C5, :C5, :C5, :A4, :C5, :D5, :C5, :C5, :D5, :F5], [1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2]], # Chorus
                [[:Bb4, :Bb4, :A4, :F4], [5, 2, 7, 1]],
                [[:Bb4, :Bb4, :D5, :A4, :G4, :F4], [4, 2, 2, 2, 1, 4]],
                [[:Bb4, :Bb4, :D5, :A4, :G4, :F4, :F4], [4, 2, 2, 2, 1, 3, 1]],
                [[:Bb4, :C5, :C5, :C5, :A4, :C5, :C5, :C5, :F5, :Bb4], [15, 2, 1, 2, 1, 3, 2, 4, 2, 3]]]
vox_order = [[[0, 1, 2, 3, 1, 4]], [[5, 1, 2, 6, 1, 7, 8, 9, 8, 10], 2, 100], [[8, 9, 8, 11], 2], [[8, 12]]]
in_thread do
  sleep 120
  use_synth :fm
  with_fx :reverb, amp: 1.75, mix: 0.4, room: 0.6, damp: 0.99 do
    with_fx :panslicer, pan_min: -0.5, pan_max: 0.5, mix: 0.7, phase: 64 do
      vox_order.each do |p, r = 1, s = 0|
        r.times do
          p.each do |index|
            vox_patterns[index].first.each do |note|
              play_pattern_timed [note], [rest = vox_patterns[index].last.shift], amp: 0.7
              vox_patterns[index].last.push(rest)
            end
          end
        end
        sleep s
      end
    end
  end
end

# RHYTHMIC SYNTH
eighths_patterns = [[:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4],
                    [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5, :E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5],
                    [:D4, :C5, :D4, :D4, :C5, :D4, :D4, :C5, :D4, :C5, :D4, :D4, :C5, :D4, :C5, :D4],
                    [:A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5, :A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5]]
eighths_order = [[[0, 1],        7,   0],
                 [[0],           1, 128],
                 [[0, 1, 2, 3],  2,  64],
                 [[0, 1, 2, 3],  2,   0],
                 [[0, 1],        6,   4],
                 [[0, 1, 2, 3],  2,   0],
                 [[0, 1],       10,   0]]
in_thread do
  with_fx :panslicer, phase: 1 do
    with_fx :compressor, slope_above: 1, slope_below: 0.5, pre_amp: 2, amp: 0.3 do
      eighths_order.each do |patterns_sequence, repeat, sleep_after|
        repeat.times do
          patterns_sequence.each do |index|
            play_pattern_timed eighths_patterns[index], [0.5], release: 0.5
          end
        end
        sleep sleep_after
      end
    end
  end
end

# OPENING SYNTH
in_thread do
  melody_patterns = [[[:C5], 1, 4], [[:E5, :C5], 0.5, 4], [[:D5], 1, 7], [[:E5, :G5], 0.5, 1]]
  melody_order = [[[0, 1, 0, 1, 2, 3], 5, 484], [[0, 1, 0, 1, 2, 3], 6], [[0, 1, 0, 1]]]
  melody_order.each do |p, r = 1, s = 0|
    r.times do
      p.each do |index|
        melody_patterns[index].last.times do
          melody_patterns[index].first.each do |note|
            play_pattern_timed [note], [melody_patterns[index].at(1)], amp: 0.25
          end
        end
      end
    end
    sleep s
  end
end

# BACKGROUND SYNTH
in_thread do
  sleep 312
  with_fx :mono, amp: 0.3, reps: 16 do
    play_pattern [:F5, :G5, :F5, :E5], attack: 1.2, release: 0.1
  end
end

# BACKGROUND CHORDS
def chords(sleep_before, notes, repeat)
  sleep sleep_before
  use_synth :saw
  repeat.times do
    notes.each do |n|
      play_pattern_timed n, [0, 0, 0, 8], sustain: 8, amp: 0.17
    end
  end
end
in_thread do
  chords(248, [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 2)
  chords(64,  [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 2)
  chords(100, [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3], [:D4, :Bb3, :F3, :D3], [:A3, :F3, :C3, :A3]], 5)
  chords(0,   [[:C4, :A3, :F3, :C3], [:C4, :G3, :E3, :C3]], 1)
end

# BASS LINE
bass_patterns = [[[:F1], [:A1], [:G1]],
                 [[:F1], [:A1], [:G1, 16]],
                 [[:Bb1, 4], [:C2, 4]],
                 [[:C2, 4], [:Bb1, 4]],
                 [[:F1, 6], [:A1, 1], [:B1, 1]],
                 [[:C2], [:Bb1], [:A1]],
                 [[:Bb1, 4]],
                 [[:C2, 5], [:D2, 2], [:F2, 2], [:Bb1, 7], [:A1]]]
bass_order = [0, 1, 0, 2, 0, 2,
              0, 2, 0, 3, 4, 5, 4, 5,
              0, 2, 0, 3, 4, 5, 4, 5,
              0, 0, 0, 0, 6,
              4, 5, 4, 5, 4, 5, 4, 5,
              4, 7, 4, 7, 4, 7]
in_thread do
  use_synth :tb303
  use_synth_defaults amp: 0.9, env_curve: 7, res: 0, sustain: 0.98, release: 0.02, cutoff: 80
  sleep 64
  with_fx :lpf do
    bass_order.each do |index|
      bass_patterns[index].each do |note, reps = 8|
        reps.times do
          play_pattern [note]
        end
      end
    end
  end
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
