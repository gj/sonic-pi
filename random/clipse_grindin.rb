#clipse - grindin'
use_bpm 96

live_loop :synth do
  sync :drums
  stop
  use_synth :dtri
  use_synth_defaults amp: 0.6, detune: 0.05, cutoff: 80, release: 0.6
  play_pattern_timed [:E4, :B4, :B4, :E4, :E4, :C5, :C5, :C5, :B4], [0.5, 0.25, 0.75, 0.5, 0.5, 0.5, 0.25, 0.25, 0.5]
  play_pattern_timed [:E4, :E4, :B4, :B4, :E4, :E4, :E4, :C5, :C5, :C5, :B4], [0.5, 0.25, 0.5, 0.25, 0.25, 0.25, 0.5, 0.5, 0.25, 0.25, 0.5]
  play_pattern_timed [:E4, :E4, :B4, :B4, :E4, :E4, :D5, :D5, :C5, :C5, :B4], [0.5, 0.25, 0.5, 0.25, 0.25, 0.25, 0.5, 0.5, 0.25, 0.25, 0.5]
  play_pattern_timed [:C5, :C5, :B4, :B4, :E4, :E4, :E4, :E4, :E4], [0.5, 0.25, 0.5, 0.25, 0.25, 0.25, 1.5, 0.25, 0.25]
end

drum_loops = {
  :bd_tek             => "X-----XX-XX--X-XXXX---XX-XX-----",
  :sn_dolf            => "----x-------x-------x-------xx-x",
  :elec_mid_snare     => "----x-------x-------x-------xx-x",
  :bd_klub            => "X-----XX-XX--X-XXXX---XX-XX-----",
  :drum_cymbal_closed => "ssSssSssSsSssSssSSssSSsSssSsSsss"
}

live_loop :drums do
  32.times do |i|
    drum_loops.each do |key, value|
      case value[i]
      when "X" then sample key, amp: 1.5, finish: 0.5
      when "x" then sample key, amp: 1, finish: 0.2
      when "S" then sample key, amp: 0.67, finish: 0.1
      when "s" then sample key, amp: 0.2, finish: 0.1
      end
    end
    sleep 0.25
  end
end
