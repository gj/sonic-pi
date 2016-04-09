# Eighth Notes Pattern No. 1
define :eighths_up do |note1, note2|
  2.times do
    play note1
    sleep 0.5
    play note2
    sleep 0.5
    play note1
    sleep 0.5
  end
  play note1
  sleep 0.5
  play note2
  sleep 0.5
end

# Eighth Notes Pattern No. 2
define :eighths_down do |note1, note2|
  2.times do
    play note1
    sleep 0.5
    play note2
    sleep 0.5
    play note1
    sleep 0.5
  end
  play note2
  sleep 0.5
  play note1
  sleep 0.5
end

# Opening Synth Pattern
define :opening_synth do
  2.times do
    4.times do
      play :C5, sustain: 0.4
      sleep 1
    end
    2.times do
      2.times do
        play :E5, sustain: 0.125
        sleep 0.5
        play :C5, sustain: 0.125
        sleep 0.5
      end
    end
  end
  7.times do
    play :D5, sustain: 0.4
    sleep 1
  end
  play :E5, sustain: 0.125
  sleep 0.5
  play :G5, sustain: 0.125
  sleep 0.5
end

# Bass Pattern
define :bass do
  # Measures 17-30
  8.times do
    play :F1
    sleep 1
  end
  8.times do
    play :A1
    sleep 1
  end
  8.times do
    play :G1
    sleep 1
  end
  8.times do
    play :F1
    sleep 1
  end
  8.times do
    play :A1
    sleep 1
  end
  16.times do
    play :G1
    sleep 1
  end
  # Measures 31-54
  3.times do
    8.times do
      play :F1
      sleep 1
    end
    8.times do
      play :A1
      sleep 1
    end
    8.times do
      play :G1
      sleep 1
    end
    4.times do
      play :Bb1
      sleep 1
    end
    4.times do
      play :C2
      sleep 1
    end
  end
  # Measures 55-62
  8.times do
    play :F1
    sleep 1
  end
  8.times do
    play :A1
    sleep 1
  end
  8.times do
    play :G1
    sleep 1
  end
  4.times do
    play :C2
    sleep 1
  end
  4.times do
    play :Bb1
    sleep 1
  end
  # Measures 63-78
  2.times do
    6.times do
      play :F1
      sleep 1
    end
    play :A1
    sleep 1
    play :B1
    sleep 1
    8.times do
      play :C2
      sleep 1
    end
    8.times do
      play :Bb1
      sleep 1
    end
    8.times do
      play :A1
      sleep 1
    end
  end
end

# Define Drum Sounds
# Snare
define :snare do |thisLong|
  with_fx :compressor, slope_above: 0, clamp_time: 0, relax_time: 0 do
    with_fx :distortion do
      with_fx :reverb, mix: 0.05, damp: 1, room: 0.1 do
        sample :elec_filt_snare, attack: 0, sustain: 0.04, rate: 2, amp: 2, release: 0
        sample :sn_dolf, attack: 0, sustain: 0.06, rate: 1.1, release: 0
        sleep thisLong
      end
    end
  end
end

# Hi-Hat
define :hihat do |thisLong|
  with_fx :compressor, clamp_time: 0, relax_time: 0 do
    with_fx :reverb, mix: 0.2, damp: 1, room: 0.5 do
      sample :drum_cymbal_closed, rate: 1.25
      sleep thisLong
    end
  end
end

# Kick
define :kick do |thisLong|
  with_fx :compressor, amp: 2, slope_above: 0, clamp_time: 0, relax_time: 0 do
    sample :bd_ada, amp: 2
    sleep thisLong
  end
end

# Crash Cymbal
define :crash do |thisLong|
  with_fx :compressor, clamp_time: 0, relax_time: 0 do
    with_fx :reverb, mix: 0.2, damp: 1, room: 0.5 do
      sample :drum_cymbal_open, rate: 1, attack: 0, sustain: 0.2
      sleep thisLong
    end
  end
end

# Clap
define :clap do |thisLong|
  with_fx :compressor, clamp_time: 0, relax_time: 0 do
    sample :perc_snap, amp: 5, attack: 0, sustain: 0.1
    sample :perc_snap2, amp: 5, attack: 0, sustain: 0.1
    sample :elec_filt_snare, attack: 0, sustain: 0.05, rate: 2, amp: 10, release: 0
    sleep thisLong
  end
end

# Standard Drum Sequence 1 (Opening)
define :standard_drums_1 do
  3.times do
    kick(0.5)
    hihat(0.5)
    kick(0)
    snare(0.5)
    hihat(0.5)
  end
  kick(0.5)
  hihat(0.5)
  kick(0)
  snare(0.5)
  hihat(0.25)
  kick(0.25)
end

# Standard Drum Sequence 2 (Clap, but no Crash)
define :standard_drums_2 do
  3.times do
    kick(0.5)
    hihat(0.5)
    clap(0)
    snare(0.5)
    hihat(0.5)
  end
  kick(0.5)
  hihat(0.5)
  clap(0)
  snare(0.5)
  hihat(0)
  snare(0.5)
end

# Standard Drum Sequence 3 (Clap and Crash)
define :standard_drums_3 do
  3.times do
    kick(0.5)
    hihat(0.5)
    clap(0)
    snare(0.5)
    hihat(0.5)
  end
  kick(0.5)
  crash(0.5)
  hihat(0)
  clap(0)
  snare(0.5)
  hihat(0)
  snare(0.5)
end

# SCORE STARTS HERE
use_bpm 175

# Panning Eighth Notes
in_thread do
  use_synth :sine
  use_synth_defaults release: 0.4, amp: 1.75
  with_fx :distortion, distort: 0.1 do
    with_fx :nhpf, cutoff: 70 do
      with_fx :panslicer, phase: 1 do
        7.times do
          eighths_up(:F3, :C4)
          eighths_down(:F3, :C4)
          eighths_up(:E3, :C4)
          eighths_up(:E3, :C4)
        end
        eighths_up(:F3, :C4)
        eighths_down(:F3, :C4)
      end
    end
  end
end

# Opening Synth
in_thread do
  use_synth :beep
  #  use_synth_defaults amp: 0.5
  with_fx :reverb, room: 0.1, damp: 1, reps: 5 do
    opening_synth
  end
end

# Bass Line
in_thread do
  use_synth :tb303
  use_synth_defaults amp: 0.5, attack: 0.01, sustain: 0.5, release: 0.5, env_curve: 7, res: 0
  with_fx :nlpf, cutoff: 80 do
    # Measures 1-16
    sleep 64
    bass
  end
end

# Drums
in_thread do
  # Measures 1-16
  sleep 64
  # Measures 17-24 w/ opening filter
  with_fx :ixi_techno, mix: 1, phase: 112, res: 0 do
    with_fx :compressor do
      4.times do
        standard_drums_1
      end
      # Measures 25-26
      3.times do
        kick(0.5)
        hihat(0.5)
        kick(0)
        snare(0.5)
        hihat(0.5)
      end
      kick(0.5)
      crash(0.5)
      kick(0)
      hihat(0)
      snare(0.5)
      hihat(0.25)
      kick(0.25)
      # Measures 27-28
      standard_drums_1
      # Measures 29-30
      kick(0.5)
      hihat(0.5)
      kick(0)
      snare(0.5)
      hihat(0.5)
      kick(0.5)
      crash(0.5)
      kick(0)
      hihat(0)
      snare(0.5)
      hihat(0.5)
      kick(0.5)
      crash(0.5)
      kick(0)
      hihat(0)
      snare(0.5)
      hihat(0)
      snare(0)
      clap(0.5)
      kick(0.5)
      kick(0)
      hihat(0)
      snare(0)
      clap(0.5)
      kick(0.5)
      kick(0)
      hihat(0)
      snare(0)
      clap(0.5)
    end
  end
  # Measures 31-63
  with_fx :compressor, reps: 4 do
    standard_drums_2
    standard_drums_3
    standard_drums_2
    standard_drums_2
  end
end

# Big Crashes
define :bigCrash do |thisLong|
  sample :drum_splash_hard
  sleep thisLong
end
in_thread do
  sleep 120
  # Measure 31
  bigCrash(128)
  # Measure 63, 71, 79, 87, 95, 103
  6.times do
    bigCrash(32)
  end
  # Measure 111, 117, 123, 129
  4.times do
    bigCrash(24)
  end
  sleep 1
  # Measure 135.25
  bigCrash(3)
  # Measure 136, 144, 152, 160
  4.times do
    bigCrash(32)
  end
end
