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
  ##| sleep 64
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
