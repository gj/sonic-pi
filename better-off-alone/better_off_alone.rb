# better off alone

use_bpm 137

live_loop :main_synth do
  use_synth :dsaw
  use_synth_defaults cutoff: 110, detune: 0.05, sustain: 0.3, release: 0.3
  with_fx :ixi_techno, phase: 256, cutoff_min: 95, res: 0 do |ixi|
    with_fx :compressor, clamp_time: 0.001, slope_above: 1, slope_below: 0.7 do
      with_fx :echo, mix: 0.06, phase: 1, decay: 8 do
        with_fx :reverb, mix: 0.2, room: 0.3, damp: 0.4 do
          control ixi, mix: 1
          2.times do
            play_pattern_timed [:B4, :As4, :B4], [7.5, 0.5, 8]
          end
          2.times do
            play_pattern_timed [:B4, :B4, :Gs4, :Fs5, :Fs5, :Ds5,
                                :B4, :B4, :Gs4, :E5, :E5, :Ds5], [1, 0.5, 4.5, 0.75, 0.75, 0.5]
          end
          control ixi, mix: 0
          2.times do
            play_pattern_timed [:B4, :B4, :Gs4, :B4, :B4, :As4, :Fs4, :Fs5, :Fs5, :Ds5,
                                :B4, :B4, :Gs4, :B4, :B4, :As4, :Fs4, :E5, :E5, :Ds5], [1, 0.5, 1, 1, 1, 1, 0.5, 0.75, 0.75, 0.5]
          end
        end
      end
    end
  end
end

live_loop :bass do
  use_synth :dsaw
  use_synth_defaults release: 0.225, res: 0, cutoff: 60, detune: 0
  use_octave -1
  with_fx :compressor, amp: 0.4, slope_above: 1, slope_below: 0.9 do
    with_fx :mono do
      play_pattern_timed [:E2, :E3, :E2, :E3, :E2, :E3, :E2, :E3,
                          :Ds2, :Ds3, :Ds2, :Ds3, :Ds2, :Ds3, :Ds2, :Ds3,
                          :Gs2, :Gs3, :Gs2, :Gs3, :Gs2, :Gs3, :Gs2, :Gs3,
                          :Fs2, :Fs3, :Fs2, :Fs3, :Fs2, :Fs3, :Fs2, :Fs3], [0.5]
    end
  end
end

live_loop :sub_base do
  use_synth :sine
  use_synth_defaults release: 0.2, env_curve: 1
  use_octave -1
  with_fx :normaliser, level: 0.2 do
    with_fx :mono do
      play_pattern_timed [:E2, :E3, :E2, :E3, :E2, :E3, :E2, :E3,
                          :Ds2, :Ds3, :Ds2, :Ds3, :Ds2, :Ds3, :Ds2, :Ds3,
                          :Gs2, :Gs3, :Gs2, :Gs3, :Gs2, :Gs3, :Gs2, :Gs3,
                          :Fs2, :Fs3, :Fs2, :Fs3, :Fs2, :Fs3, :Fs2, :Fs3], [0.5]
    end
  end
end

live_loop :kick do
  64.times do
    sample :bd_haus
    sleep 1
  end
  sleep 32
end

live_loop :hihat do
  sleep 16
  with_fx :rhpf, cutoff: 122, res: 0.75 do
    with_synth :pnoise do
      96.times do
        play :E1, attack: 0.01, decay: 0.04, release: 0.05
        sleep 0.5
      end
    end
  end
  sleep 32
end

live_loop :filter_synth do
  sleep 32
  use_synth :tb303
  use_synth_defaults release: 0.2, res: 0.9, cutoff_min: 110, cutoff: 130
  amps = [0.1, 1, 0.1, 0.5, 0.5]
  notes = [:E2, :Ds2, :Gs2, :Fs2]
  sleeps = [0.5, 0.5, 0.25, 0.25, 0.5]
  with_fx :ixi_techno, phase: 32, reps: 4 do
    notes.each do |n|
      2.times do
        amps.each do |a|
          play n, amp: a
          s = sleeps.shift
          sleep sleeps.push(s).last
        end
      end
    end
  end
end
