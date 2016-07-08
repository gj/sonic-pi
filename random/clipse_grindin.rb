#clipse - grindin'
use_bpm 96

live_loop :synth do
  use_synth :dtri
  use_synth_defaults amp: 0.75, detune: 0.05, cutoff: 80, release: 0.7
  play_pattern_timed [:E4, :B4, :B4, :E4, :E4, :C5, :C5, :C5, :B4], [0.5, 0.25, 0.75, 0.5, 0.5, 0.5, 0.25, 0.25, 0.5]
  play_pattern_timed [:E4, :E4, :B4, :B4, :E4, :E4, :E4, :C5, :C5, :C5, :B4], [0.5, 0.25, 0.5, 0.25, 0.25, 0.25, 0.5, 0.5, 0.25, 0.25, 0.5]
  play_pattern_timed [:E4, :E4, :B4, :B4, :E4, :E4, :D5, :D5, :C5, :C5, :B4], [0.5, 0.25, 0.5, 0.25, 0.25, 0.25, 0.5, 0.5, 0.25, 0.25, 0.5]
  play_pattern_timed [:C5, :C5, :B4, :B4, :E4, :E4, :E4, :E4, :E4], [0.5, 0.25, 0.5, 0.25, 0.25, 0.25, 1.5, 0.25, 0.25]
end

drum_loops = {:bd_tek  => "X-----XX-XX--X-XXXX---XX-XX-----",
              :sn_dolf => "----X-------X-------X-------XX-X",
              :bd_haus => "X-----XX-XX--X-XXXX---XX-XX-----"
              }

live_loop :drums do
  i = 0
  while i < 32
    drum_loops.each do |key, value|
      sample key if value[i] == "X"
    end
    sleep 0.25
    i += 1
  end
end
