define :bass do |notes, repeat|
  repeat.times do
    notes.each do |n, r|
      r.times do
        play_pattern [n]
      end
    end
  end
end

in_thread do
  use_synth :tb303
  use_synth_defaults amp: 0.7, env_curve: 7, res: 0, sustain: 0.982, release: 0.02, cutoff: 100
  sleep 64                                                                                                             # Measures 1-16
  bass([[:F1, 8], [:A1, 8], [:G1, 8], [:F1, 8],  [:A1, 8], [:G1, 16]],                                             1)  # Measures 17-30
  bass([[:F1, 8], [:A1, 8], [:G1, 8], [:Bb1, 4], [:C2, 4]],                                                        2)  # Measures 31-46
  2.times do
    bass([[:F1, 8], [:A1, 8], [:G1, 8], [:Bb1, 4], [:C2, 4], [:F1, 8], [:A1, 8],  [:G1, 8], [:C2, 4], [:Bb1, 4]],  1)  # Measures 47-62, 79-94
    bass([[:F1, 6], [:A1, 1], [:B1, 1], [:C2, 8],  [:Bb1, 8], [:A1, 8]],                                           2)  # Measures 63-78, 95-110
  end
  bass([[:F1, 8], [:A1, 8], [:G1, 8]],                                                                             4)  # Measures 111-134
  bass([:Bb1, 4],                                                                                                  1)  # Measure  135
  bass([[:F1, 6], [:A1, 1], [:B1, 1], [:C2, 8],  [:Bb1, 8], [:A1, 8]],                                             4)  # Measures 136-167
  bass([[:F1, 6], [:A1, 1], [:B1, 1], [:C2, 5],  [:D2, 2], [:F2, 2], [:Bb1, 7], [:A1, 8]],                         7)  # Measures 168-191
end
