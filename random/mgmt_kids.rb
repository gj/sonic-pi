use_bpm 122 # Press 'Run', then, when you want the lead synth,
# comment out the marked 'stop' below and press 'Run' again

live_loop :kids do
  stop # <<<<<<<<< COMMENT ME OUT
  sleeps1 = [1, 1, 0.5, 1, 4.5, 4]
  sleeps3 = [1, 1, 0.5, 1, 4.5, 0.5, 1, 0.5]
  sustains1 = [0.5, 1, 0.5, 0.5, 4.5, 4]
  sustains3 = [0.5, 1, 0.5, 0.5, 4.5, 0.4, 1, 0.4]
  notes1 = [[:A4, :B4, :Cs5, :E5], [:Fs5], [:Gs5], [:Fs5, :E5], [:Cs5], [:B4]]
  notes2 = [[:A4, :B4, :Cs5, :B4], [:A4], [:B4], [:A4, :Fs4], [:A4], [:Gs4]]
  notes3 = [[:A4, :B4, :Cs5, :B4], [:A4], [:B4], [:A4, :Fs4], [:A4], [:D5, :Cs5, :B4], [:A4], [:B4, :A4, :Gs4]]
  order = [notes1, notes2, notes1, notes3]
  sync :drums
  use_synth :dsaw
  use_synth_defaults detune: 0.12, cutoff: 100, release: 0.2, amp: 1
  with_fx :reverb, room: 0.4, damp: 1, mix: 0.1 do
    order.each do |pattern|
      if pattern != notes3
        6.times do |i|
          play_pattern_timed pattern[i], sleeps1[i], sustain: sustains1[i]
        end
      else
        8.times do |i|
          play_pattern_timed pattern[i], sleeps3[i], sustain: sustains3[i]
        end
      end
    end
  end
end

drum_loops = {
  :drum_heavy_kick    => "X---X---X---X---",
  :bd_fat             => "X---X---X---X---",
  :bd_tek             => "X---X---X---X---",
  :sn_dolf            => "----X-------X---",
  ##| :drum_cymbal_closed => "-sSS-sSS-sSS-sSS"
}

live_loop :drums do
  with_fx :hpf, cutoff: 30, amp: 1.3 do
    with_fx :reverb, mix: 0.4, damp: 0.8, room: 0.5 do
      16.times do |n|
        drum_loops.each do |key, value|
          case value[n]
          when "X" then sample key, amp: 1.5, finish: 1
          when "S" then sample key, amp: 0.6, finish: 0.1
          when "s" then sample key, amp: 0.2, finish: 0.1
          end
        end
        sleep 0.25
      end
    end
  end
end

live_loop :bass do
  use_synth :fm
  use_synth_defaults divisor: 8, cutoff: 110, amp: 0.5, depth: 3
  use_octave 2
  patterns = [[:Fs3, :Cs4], [:D3, :A3], [:A3, :E4], [:Gs3, :E4]]
  with_fx :reverb, mix: 0.2, room: 0.75, damp: 1 do
    patterns.each do |notes|
      4.times do
        play_pattern_timed notes, 0.5
      end
    end
  end
end

def thick_pad(note, key)
  use_octave 1
  use_synth :supersaw
  use_synth_defaults res: 0, cutoff: 100, sustain: 4, release: 1, attack: 0, amp: 0.3
  with_fx :reverb, mix: 0.5, room: 0.5, damp: 0.5 do
    with_fx :distortion, distort: 0.5 do
      play chord(note, key, num_octaves: 3)
      with_synth :dsaw do
        play chord(note, key, num_octaves: 3)
      end
    end
    sleep 4
  end
end

live_loop :pad do
  with_fx :ixi_techno, phase: 64, cutoff_min: 80, cutoff_max: 100 do
    4.times do
      thick_pad(:Fs2, :minor)
      thick_pad(:D2, :major)
      thick_pad(:A2, :major)
      thick_pad(:E2, :major)
    end
  end
end
