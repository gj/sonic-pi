use_bpm 124

def chip_synth
  use_synth :square
  use_octave 1
  use_synth_defaults release: 0.5, cutoff: 120, env_curve: 7, amp: 0.5, pan: 0.1
  
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
  use_synth_defaults release: 1, sustain: 0, pan: -0.1, cutoff: 130, depth: 2, divisor: 2
  
  play_pattern_timed [:G2, :G2, :G2, :G2, :F2,
                      :Bb2, :Bb2, :Bb2, :C3, :Eb3,
                      :D3, :D3, :D3, :D3, :Eb3,
                      :F3, :F3, :F3, :D3, :F3], [1, 0.75, 0.75, 1, 0.5]
end

##| use_bpm 12

def drums
  sample_patterns = {
    :bd_tek             => "9-------9-------9-------9-------",
    :sn_dolf            => "--------3---------------3-------",
    :drum_cymbal_pedal  => "6-1-1-1-6-1-1-6-1-1-1-1-6-1-1-1-"
  }
  
  32.times do |i|
    sample_patterns.each do |s, p|
      ##| puts i / 8 if i % 8 == 0
      
      puts "BASS DRUM!" if s == :bd_tek && p[i] != "-"
      
      ##| case p[i]
      ##| when "9" then sample s, amp: 1.5, finish: 0.5
      ##| when "6" then sample s, amp: 1, finish: 0.2
      ##| when "3" then sample s, amp: 0.67, finish: 0.5
      ##| when "1" then sample s, amp: 0.1, finish: 0.1
      ##| end
    end
    sleep 0.125
  end
end

def play_song
  ##| live_loop :chip_synth do
  ##|   sync :bass_line
  ##|   chip_synth
  ##| end
  
  live_loop :bass_line do
    bass_line
  end
  
  live_loop :drums do
    drums
  end
end

play_song
