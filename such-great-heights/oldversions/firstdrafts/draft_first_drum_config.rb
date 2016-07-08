# Old Drum Config

# Define Drum Sounds
# Snare
define :snare do
  with_fx :compressor, slope_above: 0, clamp_time: 0, relax_time: 0 do
    with_fx :distortion do
      with_fx :reverb, mix: 0.05, damp: 1, room: 0.1 do
        sample :elec_filt_snare, attack: 0, sustain: 0.04, rate: 2, amp: 2, release: 0
        sample :sn_dolf, attack: 0, sustain: 0.06, rate: 1.1, release: 0
      end
    end
  end
end

# Hi-Hat
define :hihat do
  with_fx :compressor, clamp_time: 0, relax_time: 0 do
    with_fx :reverb, mix: 0.2, damp: 1, room: 0.5 do
      sample :drum_cymbal_closed, rate: 1.25
    end
  end
end

# Kick
define :kick do
  with_fx :compressor, amp: 2, slope_above: 0, clamp_time: 0, relax_time: 0 do
    sample :bd_ada, amp: 2
  end
end

# Baby Crash Cymbal
define :crash do
  with_fx :compressor, clamp_time: 0, relax_time: 0 do
    with_fx :reverb, mix: 0.2, damp: 1, room: 0.5 do
      sample :drum_cymbal_hard, rate: 1.25
    end
  end
end

# Drums
use_bpm 175

in_thread do
  # Measures 1-16
  # sleep 64
  # Measures 17-30 w/ opening filter
  # with_fx :ixi_techno, mix: 1, phase: 112, res: 0 do
  with_fx :compressor, reps: 7 do
    3.times do
      kick
      sleep 0.5
      hihat
      sleep 0.5
      kick
      snare
      sleep 0.5
      hihat
      sleep 0.5
    end
    kick
    sleep 0.5
    hihat
    sleep 0.5
    kick
    snare
    sleep 0.5
    hihat
    sleep 0.25
    kick
    sleep 0.25
  end
  # end
  # Measures 31+
  with_fx :compressor, amp: 1.5, reps: 192 do
    3.times do
      kick
      sleep 0.5
      hihat
      sleep 0.5
      kick
      snare
      sleep 0.5
      hihat
      sleep 0.5
    end
    kick
    sleep 0.5
    hihat
    sleep 0.5
    kick
    snare
    sleep 0.5
    hihat
    sleep 0.25
    kick
    sleep 0.25
  end
end
