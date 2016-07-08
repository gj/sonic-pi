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
  ##| sleep 120
  use_synth :saw
  use_octave -2
  with_fx :reverb, amp: 1.75, mix: 0.4, room: 0.6, damp: 0.99 do
    with_fx :panslicer, pan_min: -0.5, pan_max: 0.5, mix: 0.7, phase: 64 do
      with_fx :lpf do
        vox_order.each do |p, r = 1, s = 0|
          r.times do
            p.each do |index|
              vox_patterns[index].first.each do |note|
                play_pattern_timed [note], [rest = vox_patterns[index].last.shift]
                vox_patterns[index].last.push(rest)
              end
            end
          end
          sleep s
        end
      end
    end
  end
end
