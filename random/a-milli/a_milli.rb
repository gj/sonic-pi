# lil wayne - a milli
use_bpm 76

live_loop :wayne do
  sample "/path/to/sample/a_milli_clip.flac"
  sleep 8
end

drum_hash = {
  # clap-ish sound
  :elec_hi_snare      => "----X-------X---",
  :drum_snare_soft    => "----X-------X---",
  :perc_snap          => "----X-------X---",
  
  # bass drum
  :bd_boom            => "X--X--X---X--X--",
  
  # uncomment the below if you want a hi-hat
  ##| :drum_cymbal_closed => "xXxxXxxXxXxxXXXx"
}

live_loop :drums do
  16.times do |n|
    drum_hash.each do |key, value|
      sample key if value[n] == "X" # capital 'X' = hard hit
      sample key, amp: 0.5, finish: 0.2 if value[n] == "x" # lowercase 'x' = light hit
    end
    sleep 0.25
  end
end
