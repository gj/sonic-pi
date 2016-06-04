# VOCAL SYNTH
vox_patterns = [[[:F4, :C4], [3.5, 0.5], 1],
                [[:F4], [1], 3],
                [[:G4, :E4, :C4, :C4, :E4, :E4, :E4, :F4, :D4, :C4, :Bb3, :Bb3, :Bb3], [0.5, 3.5, 0.5, 0.5, 0.5, 1, 1, 1, 1.5, 1, 1, 1, 0.5], 1],
                [[:Bb3, :Bb3, :Bb3, :Bb3], [1, 1, 1.5, 0.5], 2],
                [[:A3, :G3], [1.5, 1], 1],
                [[:F3, :F3, :F4], [1, 0, 4], 1],
                [[:A3, :G3, :F3, :F3], [1.5, 1, 1, 0], 1],
                [[:F4], [4], 1],
                [[:F3, :C4, :F4, :C4], [0, 1, 3.5, 0.5], 1],
                [[:A3, :G3, :F3], [1.5, 1, 1], 1],
                
                # FM synth
                [[:C5], [1], 5],
                [[:A4, :C5], [1, 1], 1],
                [[:D5, :C5, :C5, :D5, :F5], [2, 2, 2, 2, 2], 1],
                [[:Bb4, :Bb4, :A4, :F4], [5, 2, 7, 1], 1],
                [[:Bb4, :Bb4, :D5, :A4, :G4, :F4], [4, 2, 2, 2, 1, 4], 1],
                [[:Bb4, :Bb4, :D5, :A4, :G4, :F4, :F4], [4, 2, 2, 2, 1, 3, 1], 1],
                [[:Bb4], [15], 1],
                [[:C5, :C5, :C5], [2, 1, 2], 1],
                [[:A4, :C5, :C5, :C5, :F5, :Bb4], [1, 3, 2, 4, 2, 3], 1]]

vox_order = [[[0, 1, 2, 3, 4, 5, 1, 2, 3, 6], 1, 0],
             [[7, 1, 2, 3, 4, 8, 1, 2, 3, 9, 10, 11, 12, 13, 10, 11, 12, 14], 2, 100],
             [[10, 11, 12, 13, 10, 11, 12, 15], 2, 0],
             [[10, 11, 12, 16, 17, 18], 1, 0]]

in_thread do
  ##| sleep 120
  use_synth :fm
  with_fx :reverb, amp: 1.75, mix: 0.4, room: 0.6, damp: 0.99 do
    with_fx :panslicer, pan_min: -0.5, pan_max: 0.5, mix: 0.7, phase: 64, probability: 0.5, prob_pos: 0.5, smooth: 0.1 do
      vox_order.each do |p, r = 1, s = 0|
        r.times do
          p.each do |index|
            vox_patterns[index].last.times do
              vox_patterns[index].first.each do |note|
                play_pattern_timed [note], [rest = vox_patterns[index][1].shift]
                vox_patterns[index][1].push(rest)
              end
            end
          end
        end
        sleep s
      end
    end
  end
end
