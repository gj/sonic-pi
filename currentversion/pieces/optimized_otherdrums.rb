# -==---====-----======-------========---------========== OTHER DRUMS
define :drum do |repeat, samp, repeat_sleep, end_sleep|
  repeat.times do
    sample samp, sustain: 0.1
    sleep repeat_sleep
  end
  sleep end_sleep
end

in_thread do ############################# CLAPS
  sleep 121
  drum(66, :elec_mid_snare, 2, 0)        # Measures 31-63
  2.times do                             # Measures 64-127
    drum(3, :elec_mid_snare, 1, 1)
    drum(62, :elec_mid_snare, 2, 0)
  end
  drum(14, :elec_mid_snare, 2, 4)        # Measures 128-135
  drum(2, :elec_mid_snare, 2, 0)         # Measure  136
  drum(3, :elec_mid_snare, 1, 1)         # Measure  137
  drum(26, :elec_mid_snare, 2, 0)        # Measure  138-150
  drum(1, :elec_mid_snare, 2.25, 0)      # Measure  151
  drum(1, :elec_mid_snare, 0.5, 0)
  drum(1, :elec_mid_snare, 1.25, 0)
  2.times do                             # Measure  152-167
    drum(2, :elec_mid_snare, 2, 0)
    drum(3, :elec_mid_snare, 1, 1)
    drum(12, :elec_mid_snare, 2, 0)
  end
  8.times do                             # Measure  168-183
    drum(2, :elec_mid_snare, 2, 0)
    drum(3, :elec_mid_snare, 1, 1)
  end
end

in_thread do ############################# BIG CRASH CYMBAL
  sleep 120
  drum(1, :drum_splash_hard, 128, 0)     # Measure 31
  drum(6, :drum_splash_hard, 32, 0)      # Measure 63, 71, 79, 87, 95, 103
  drum(4, :drum_splash_hard, 24, 1)      # Measure 111, 117, 123, 129
  drum(1, :drum_splash_hard, 3, 0)       # Measure 135.25
  drum(4, :drum_splash_hard, 32, 0)      # Measure 136, 144, 152, 160
end

in_thread do ############################# HI-HAT
  sleep 120.5
  drum(320, :drum_cymbal_pedal, 1, 0)    # Measures 31-110
  drum(96, :drum_cymbal_closed, 1, 4)    # Measures 111-135
  drum(160, :drum_cymbal_pedal, 1, 0)    # Measures 136-175
end

in_thread do ############################# KICK
  sleep 120
  drum(208, :bd_ada, 2, 0)               # Measures 31-134
  drum(1, :bd_ada, 0.5, 0)               # Measure  135
  drum(1, :bd_ada, 2.5, 0)
  drum(1, :bd_ada, 1, 0)
  drum(31, :bd_ada, 2, 0)                # Measures 136-151
  drum(1, :bd_ada, 1, 0)                 # Measure  151.5
  drum(4, :bd_ada, 0.25, 0)
  drum(32, :bd_ada, 2, 0)                # Measures 152-167
end
