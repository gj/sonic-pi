# The Postal Service - Such Great Heights (Sonic Pi Version)
################################################################################
################################ EVERYTHING ELSE ###############################
######################## Place in Buffer #1 - Run THIRD ########################
################################################################################
use_bpm 175
cue :drums
cue :repetitions

# -==---====-----======-------========---------========== Vocals (Close enough!)
define :vocals do
  play_pattern_timed [:F4, :F4, :F4, :G4, :E4, :C4, :C4, :E4, :E4, :E4, :F4, :D4, # measure 1-3
  :C4, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :Bb3, :A3, :G3], # measure 4-8
    [1, 1, 1, 0.5, 3.5, 0.5, 0.5, 0.5, 1, 1, 1, 1.5, 1, 1, 1, 0.5, 1, 1, 1.5, 0.5, 1, 1, 1.5, 0.5, 1.5, 1]
end

in_thread do
  use_synth :piano
  use_synth_defaults attack: 0.1, release: 1, env_curve: 1, divisor: 1, depth: 2
  sleep 120  # Measures 1-30
  with_fx :reverb, mix: 0.3, room: 0.7, damp: 0.9 do
    with_fx :nhpf, cutoff: 60 do
      play_pattern_timed [:F4, :C4], [3.5, 0.5]
      vocals
      play_pattern_timed [:F3, :F3, :F4], [1, 0, 4]
      vocals
      play_pattern_timed [:F3, :F3, :F4], [1, 0, 4]
      vocals
      play_pattern_timed [:F3, :C4, :F4, :C4], [0, 1, 3.5, 0.5]
      vocals
      play :F3
      sleep 1
      sleep 516      # Will be fixed after I finish filling out the first buffer
end end end

################################################################################
#################################### DRUMS #####################################
######################## Place in Buffer #2 - Run SECOND #######################
################################################################################
use_bpm 175
sync :drums

define :drum do |samp, rest|
  sample samp, sustain: 0.1
  sleep rest
end

# Measures 1-30
opening_loops = [ { # Measures 17, 19, 21, 23, 25, 27
                    :bd_ada               => "X...X...X...X..." ,
                    :sn_dolf              => "....X.......X..." ,
                    :drum_cymbal_pedal   => "..X...X...X...X." } ,
                  { # Measures 18, 20, 22, 24, 28
                    :bd_ada               => "X...X...X...X..X" ,
                    :sn_dolf              => "....X.......X..." ,
                    :drum_cymbal_pedal   => "..X...X...X...X." } ,
                  { # Measure 26
                    :bd_ada               => "X...X...X...X..." ,
                    :sn_dolf              => "....X.......X..." ,
                    :drum_cymbal_pedal   => "..X...X...X...X." ,
                    :drum_cymbal_open     => "..X............." } ,
                  { # Measure 29
                    :bd_ada               => "X...X...X...X..." ,
                    :sn_dolf              => "....X.......X..." ,
                    :drum_cymbal_pedal   => "..X...X.....X.X." ,
                    :drum_cymbal_open     => "..........X....." } ,
                  { # Measure 30
                    :bd_ada               => "X...X...X.X.X.X." ,
                    :sn_dolf              => "....X.X...X...X." ,
                    :drum_cymbal_pedal   => "....X.X...X...X." ,
                    :drum_cymbal_open     => "..X............." ,
                    :elec_mid_snare       => "......X...X...X." } ]
opening_order = [0, 1, 0, 1, 0, 1,        # Measures 17-22
                 0, 1, 0, 2, 0, 1, 3, 4]  # Measures 23-30
in_thread do
  sleep 64                                # Measures 1-16
  with_fx :ixi_techno, mix: 1, phase: 112, res: 0 do
    with_fx :compressor, amp: 2, slope_above: 0 do
      with_fx :reverb, mix: 0.05, damp: 1, room: 0.1 do
        opening_order.each do |i|
          16.times do |j|
            opening_loops[i].each do |samp, patt|
              sample samp, sustain: 0.2 if patt[j] == "X"
            end
            sleep 0.25
end end end end end end

# Measures 31-183
# Hi-Hat
in_thread do
  # sleep 56.5
  sleep 120.5                                         # Measures 1-31.125
  with_fx :compressor, slope_above: 0 do
    with_fx :reverb, mix: 0.2, damp: 1, room: 0.5 do
      320.times do drum(:drum_cymbal_pedal, 1) end   # Measures 31-110
      96.times do drum(:drum_cymbal_closed, 1) end      # Measures 111-134
      sleep 4                                         # Measure  135
      160.times do drum(:drum_cymbal_pedal, 1) end   # Measures 136-175
      sleep 32                                        # Measures 176-183
end end end

# Kick
in_thread do
  # sleep 56
  sleep 120                                           # Measures 1-30
  with_fx :compressor, amp: 2, slope_above: 0 do
    208.times do drum(:bd_ada, 2) end                 # Measures 31-134
    drum(:bd_ada, 0.5)                                # Measure  135
    drum(:bd_ada, 2.5)
    drum(:bd_ada, 1)
    31.times do drum(:bd_ada, 2) end                  # Measures 136-151
    drum(:bd_ada, 1)                                  # Measure  151.5
    4.times do drum(:bd_ada, 0.25) end
    32.times do drum(:bd_ada, 2) end                  # Measures 152-167
    sleep 64                                          # Measures 168-183
end end

# Claps
in_thread do
  # sleep 57
  sleep 121                                        # Measures 1-30
  with_fx :compressor, amp: 2, slope_above: 0 do
    66.times do drum(:elec_mid_snare, 2) end      # Measures 31-63
    2.times do                                     # Measures 64-127
      3.times do drum(:elec_mid_snare, 1) end
      sleep 1
      62.times do drum(:elec_mid_snare, 2) end
    end
    14.times do drum(:elec_mid_snare, 2) end      # Measures 128-134
    sleep 4                                        # Measure  135
    2.times do drum(:elec_mid_snare, 2) end       # Measure  136
    3.times do drum(:elec_mid_snare, 1) end       # Measure  137
    sleep 1
    26.times do drum(:elec_mid_snare, 2) end      # Measure  138-150
    drum(:elec_mid_snare, 2.25)                   # Measure  151
    drum(:elec_mid_snare, 0.5)
    drum(:elec_mid_snare, 1.25)
    2.times do                                     # Measure  152-167
      2.times do drum(:elec_mid_snare, 2) end
      3.times do drum(:elec_mid_snare, 1) end
      sleep 1
      12.times do drum(:elec_mid_snare, 2) end
    end
    8.times do                                     # Measure  168-183
      2.times do drum(:elec_mid_snare, 2) end
      3.times do drum(:elec_mid_snare, 1) end
      sleep 1
end end end

# Main Snare                                            Pattern # - First instance (Measure)
snare_loops = [ { :sn_dolf => "....X.......X..." } ,  # 0 - 31
                { :sn_dolf => "....X.......X.X." } ,  # 1 - 32
                { :sn_dolf => "X.XXX.X.....X.X." } ,  # 2 - 70
                { :sn_dolf => "....X...X...X.X." } ,  # 3 - 72
                { :sn_dolf => "....X.X.....X..." } ,  # 4 - 75
                { :sn_dolf => "..X.X.....XXX.X." } ,  # 5 - 77
                { :sn_dolf => "..X.X...X.XXX.X." } ,  # 6 - 78
                { :sn_dolf => "....X.......X.XX" } ,  # 7 - 134
                { :sn_dolf => "..........XX..XX" } ,  # 8 - 135
                { :sn_dolf => "..X.X.....X.X.X." } ,  # 9 - 151
                { :sn_dolf => "....X..........." } ]  # 10 - 169   Measures
snare_order = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,   # 31-46
               0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,   # 47-62
               0, 1, 0, 1, 0, 1, 0, 2, 0, 3, 0, 3, 4, 1, 5, 6,   # 63-78
               0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 2,   # 79-94
               0, 1, 0, 1, 0, 1, 0, 2, 0, 3, 0, 3, 4, 1, 5, 6,   # 95-110
               0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,   # 111-126
               0, 1, 0, 1, 0, 1, 0, 7, 8, 0, 1, 0, 1, 0, 1, 0,   # 127-142
               2, 0, 3, 0, 3, 4, 1, 5, 9, 0, 1, 0, 1, 0, 1, 0,   # 143-158
               1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 10, 0, 10, 0, 10,   # 159-173
               0, 10, 0, 10, 0, 10, 0, 10, 0, 10]                # 174-183
in_thread do
  # sleep 56
  sleep 120                                           # Measures 1-30
  with_fx :compressor, amp: 1.2, slope_above: 0 do
    with_fx :distortion do
      with_fx :reverb, mix: 0.05, damp: 1, room: 0.1 do
        snare_order.each do |i|
          16.times do |j|
            snare_loops[i].each do |samp, patt|
              sample samp, sustain: 0.2 if patt[j] == "X"
              sample :elec_filt_snare, sustain: 0.1 if patt[j] == "X"
            end
            sleep 0.25
end end end end end end

# Big Crash
define :bigCrash do |rest1, rest2|
  sleep rest1
  sample :drum_splash_hard
  sleep rest2
end
in_thread do
  bigCrash(120, 128)                                  # Measure 31
  6.times do bigCrash(0, 32) end                      # Measure 63, 71, 79, 87, 95, 103
  4.times do bigCrash(0, 24) end                      # Measure 111, 117, 123, 129
  bigCrash(1, 3)                                      # Measure 135.25
  4.times do bigCrash(0, 32) end                      # Measure 136, 144, 152, 160
end

################################################################################
################################# REPETITIONS ##################################
######################## Place in Buffer #3 - Run FIRST ########################
################################################################################
use_bpm 175
sync :repetitions

# -==---====-----======-------========---------========== Panning Eighth Notes
define :eighths1 do
  play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5], [0.5]
  play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4], [0.5]
  play_pattern_timed [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5], [0.5]
  play_pattern_timed [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5], [0.5]
end
define :eighths2 do
  play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5], [0.5]
  play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4], [0.5]
end
define :eighths3 do
  play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5], [0.5]
  play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4], [0.5]
  play_pattern_timed [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5], [0.5]
  play_pattern_timed [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5], [0.5]
  play_pattern_timed [:D4, :C5, :D4, :D4, :C5, :D4, :D4, :C5], [0.5]
  play_pattern_timed [:D4, :C5, :D4, :D4, :C5, :D4, :C5, :D4], [0.5]
  play_pattern_timed [:A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5], [0.5]
  play_pattern_timed [:A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5], [0.5]
end

in_thread do
  use_synth :sine
  use_synth_defaults release: 0.4, amp: 1.75
  with_fx :distortion, distort: 0.05, amp: 5 do
    with_fx :compressor, amp: 20, threshold: 0.01, slope_above: 0.01, relax_time: 0.1 do
      with_fx :panslicer, phase: 1 do
        7.times do eighths1 end     # Measures   1- 28
        eighths2                    # Measures  29- 30
        sleep 128                   # Measures  31- 62
        2.times do eighths3 end     # Measures  63- 78
        sleep 64                    # Measures  79- 94
        2.times do eighths3 end     # Measures  95-110
        6.times do eighths1 end     # Measures 111-134
        sleep 4                     # Measure  135
        2.times do eighths3 end     # Measures 136-151
        10.times do eighths1 end    # Measures 152-191
end end end end

# -==---====-----======-------========---------========== Strings Pad
define :chords1 do
  play [:C5, :A4, :F4, :C4, :A3, :F3, :C3]
  sleep 8
  play [:C5, :G4, :E4, :C4, :G3, :E3, :C3]
  sleep 8
end
define :chords2 do
  play [:D5, :Bb4, :F4, :D4, :Bb3, :F3, :D3]
  sleep 8
  play [:A4, :F4, :C4, :A3, :F3, :C3]
  sleep 8
end

in_thread do
  use_synth :saw
  use_synth_defaults sustain: 8
  with_fx :reverb, room: 0.3, damp: 1 do
    sleep 248    # Measures 1-62
    2.times do   # Measures 63-78, 95-110
      chords1
      chords2
      chords1
      chords2
      sleep 64   # Measures 79-94, 111-126
    end
    sleep 36     # Measures 127-135
    5.times do   # Measures 136-175
      chords1
      chords2
    end
    chords1      # Measures 176-179
end end

# -==---====-----======-------========---------========== Background Whiny Synth
in_thread do
  sleep 312
  use_synth :sine
  with_fx :mono, reps: 16 do
    play_pattern [:F5, :G5, :F5, :E5], attack: 1.2, release: 0.1
end end

# -==---====-----======-------========---------========== Opening Synth
in_thread do
  use_synth :beep
  with_fx :compressor, threshold: 2, slope_above: 0.01, relax_time: 2, reps: 5 do
    2.times do
      play_pattern [:C5, :C5, :C5, :C5], sustain: 0.4, release: 0.95
      play_pattern_timed [:E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [0.5], sustain: 0.125
    end
    play_pattern [:D5, :D5, :D5, :D5, :D5, :D5, :D5], sustain: 0.4, release: 0.95
    play_pattern_timed [:E5, :G5], [0.5], sustain: 0.125
  end
  sleep 484
  with_fx :compressor, threshold: 2, slope_above: 0.01, relax_time: 2, reps: 6 do
    2.times do
      play_pattern [:C5, :C5, :C5, :C5], sustain: 0.4, release: 0.95
      play_pattern_timed [:E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [0.5], sustain: 0.125
    end
    play_pattern [:D5, :D5, :D5, :D5, :D5, :D5, :D5], sustain: 0.4, release: 0.95
    play_pattern_timed [:E5, :G5], [0.5], sustain: 0.125
  end
  2.times do
    play_pattern [:C5, :C5, :C5, :C5], sustain: 0.4, release: 0.95
    play_pattern_timed [:E5, :C5, :E5, :C5, :E5, :C5, :E5, :C5], [0.5], sustain: 0.125
end end

# -==---====-----======-------========---------========== Bass Line
in_thread do
  use_synth :tb303
  use_synth_defaults amp: 0.6, env_curve: 7, res: 0, sustain: 0.875, release: 0.05
  sleep 64                                                      # Measures 1-16
  with_fx :normaliser do
    with_fx :nlpf, cutoff: 80 do
      with_fx :echo, phase: 1, decay: 1.975, max_phase: 1 do
        play_pattern_timed [:F1, :A1, :G1, :F1,                 # Measures 17-24
                            :A1, :G1, :G1], [8]                 # Measures 25-30
        2.times do
          play_pattern_timed [:F1, :A1,                         # Measures 31-34, 39-42
                              :G1, :Bb1, :C2], [8, 8, 8, 4, 4]  # Measures 35-38, 43-46
      end end
      2.times do
        with_fx :echo, phase: 1, decay: 1.975, max_phase: 1 do
          play_pattern_timed [:F1, :A1,                         # Measures 47-50, 79-82
                              :G1, :Bb1, :C2], [8, 8, 8, 4, 4]  # Measures 51-54, 83-86
          play_pattern_timed [:F1, :A1,                         # Measures 55-58, 87-90
                              :G1, :C2, :Bb1], [8, 8, 8, 4, 4]  # Measures 59-62, 91-94
        end
        2.times do
          play_pattern [:F1, :F1, :F1, :F1, :F1, :F1, :A1, :B1, # Measures 63-64, 71-72, 95-96, 103-104
                        :C2, :C2, :C2, :C2, :C2, :C2, :C2, :C2,
                        :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1,
                        :A1, :A1, :A1, :A1, :A1, :A1, :A1, :A1]
      end end
      with_fx :echo, phase: 1, decay: 1.975, max_phase: 1, reps: 4 do
        play_pattern_timed [:F1, :A1, :G1], [8]  # Measures 111-134
      end
      play :Bb1, sustain: 4                                   # Measure 135
      4.times do                                              # Measures 136-167
        play_pattern [:F1, :F1, :F1, :F1, :F1, :F1, :A1, :B1,
                      :C2, :C2, :C2, :C2, :C2, :C2, :C2, :C2,
                      :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1,
                      :A1, :A1, :A1, :A1, :A1, :A1, :A1, :A1]
      end
      3.times do                                              # Measures 168-191
        play_pattern [:F1, :F1, :F1, :F1, :F1, :F1, :A1, :B1,
                      :C2, :C2, :C2, :C2, :C2, :D2, :D2, :F2,
                      :F2, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1, :Bb1,
                      :A1, :A1, :A1, :A1, :A1, :A1, :A1, :A1]
end end end end
