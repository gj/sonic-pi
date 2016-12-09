use_bpm 124

def chip_synth_saw
  use_synth :dsaw
  use_octave 1
  use_synth_defaults release: 0.5, cutoff: 130, detune: 0.125, env_curve: 7, amp: 0.25
  
  with_fx :ixi_techno, cutoff_min: 100, phase: 16, res: 0.5 do
    with_fx :reverb do
      with_fx :flanger, stereo_invert_wave: 1 do
        play_pattern_timed [:Bb3, :A3, :Bb3, :G3, :Bb3, :A3, :Bb3, :G3,
                            :Bb3, :A3, :Bb3, :F3, :Bb3, :A3, :Bb3, :F3,
                            :A3, :G3, :A3, :F3, :A3, :G3, :A3, :F3,
                            :A3, :G3, :A3, :F3, :A3, :G3, :A3, :F3], [0.5]
      end
    end
  end
end

def chip_synth_square
  use_synth :square
  use_octave 1
  use_synth_defaults release: 0.5, cutoff: 120, env_curve: 7, amp: 0.75
  
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
  use_synth_defaults release: 0.75
  
  play_pattern_timed [:G2, :G2, :G2, :G2, :F2,
                      :Bb2, :Bb2, :Bb2, :C3, :Eb3,
                      :D3, :D3, :D3, :D3, :Eb3,
                      :F3, :F3, :F3, :D3, :F3], [1, 1, 0.75, 0.75, 0.5]
end

def play_song
  in_thread do
    loop do
      chip_synth_saw
    end
  end
  
  in_thread do
    loop do
      chip_synth_square
    end
  end
  
  in_thread do
    loop do
      bass_line
    end
  end
end

play_song
