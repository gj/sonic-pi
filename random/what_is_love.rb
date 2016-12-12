use_bpm 124

def chip_synth
  use_synth :square
  use_octave 1
  use_synth_defaults release: 0.5, cutoff: 120, env_curve: 7, amp: 0.75, pan: 0.1
  
  with_fx :ixi_techno, cutoff_min: 100, phase: 16, res: 0.5 do
    with_fx :reverb do
      with_fx :bitcrusher, sample_rate: 20000, bits: 16 do
        play_pattern_timed [:Bb3, :A3, :Bb3, :G3, :Bb3, :A3, :Bb3, :G3,
                            :Bb3, :A3, :Bb3, :F3, :Bb3, :A3, :Bb3, :F3,
                            :A3, :G3, :A3, :F3, :A3, :G3, :A3, :F3,
                            :A3, :G3, :A3, :F3, :A3, :G3, :A3, :F3], [0.5]
      end
    end
  end
end

def bass_line
  use_synth :fm
  use_synth_defaults release: 0.75, pan: -0.1
  
  play_pattern_timed [:G2, :G2, :G2, :G2, :F2,
                      :Bb2, :Bb2, :Bb2, :C3, :Eb3,
                      :D3, :D3, :D3, :D3, :Eb3,
                      :F3, :F3, :F3, :D3, :F3], [1, 0.75, 0.75, 1, 0.5]
end

def drums
  sample_patterns = {
    :bd_tek             => "--------------------------------",
    :sn_dolf            => "--------------------------------",
    :elec_mid_snare     => "--------------------------------",
    :bd_klub            => "--------------------------------",
    :drum_cymbal_closed => "--------------------------------"
  }
  
  32.times do |i|
    sample_patterns.each do |s, p|
      case p[i]
      when "X" then sample s, amp: 1.5, finish: 0.5
      when "x" then sample s, amp: 1, finish: 0.2
      when "S" then sample s, amp: 0.67, finish: 0.1
      when "s" then sample s, amp: 0.2, finish: 0.1
      end
    end
  end
end

def play_song
  in_thread do
    loop do
      chip_synth
    end
  end
  
  in_thread do
    loop do
      bass_line
    end
  end
  
  in_thread do
    loop do
      drums
    end
  end
end

play_song
