use_bpm 85

drum_loops = {
  :bd_klub            => "x-----------x-----x---------x---x-----------x-----x---------x---",
  :bd_808             => "----X-----X-----X-------------------X-----X-----X-----X---------",
  :elec_cymbal        => "----1-------1-------1-------1-----------------------------------",
  :elec_tick          => "3-----3-------3---1---3---------1-1---1-------1-----1-----1-----",
  :drum_cymbal_closed => "2-1-1-1-4-1-1-2-1-1-1-1-4-2-1-1-2-1-1-1-4-1-1-2-1-1-1-1-4-2-1-1-",
  :drum_cymbal_pedal  => "-1-2-1-2-1-2-2-1-2-2-1-2-1-1-1-1-1-1-1-2-1-1-1-1-1-1-2-2-1-1-1-2",
  ##| :guit_harmonics     => "4-4-4-----4-4---6-------6-------4-4---4-4---6-------6-------6---",
  :sn_dolf            => "--------5---------------5---------------5---------------5-----5-",
}

live_loop :drums do
  with_fx :reverb, mix: 0.2, room: 0.2, damp: 0.8, amp: 1 do
    64.times do |n|
      drum_loops.each do |key, value|
        case value[n]
        when 'X' then sample key, amp: 2, finish: 1
        when 'x' then sample key, amp: 1, finish: 1
        else
          i = value[n].to_f/10
          sample key, amp: key == :guit_harmonics ? i*2 : i, finish: key == :guit_harmonics ? i/4 : i/2#, rate: rrand_i(0, 1024) % (n+1) == 0 ? rrand(-1.5, -1) : 1
        end
      end
      sleep 0.125
    end
  end
end
