# DRUMS - Place in its own buffer - RUN FIRST
use_bpm 175
sync :drums

define :drum do |repeat, samp, rests, end_sleep|
  repeat.times do
    rests.each do |r|
      sample samp
      sleep r
    end
  end
  sleep end_sleep
end

# KICK
in_thread do
  sleep 64
  with_fx :ixi_techno, amp: 0.75, mix: 1, phase: 112, res: 0 do |phaser|
    drum(4, :bd_ada, [1, 1, 1, 1, 1, 1, 1, 0.75, 0.25], 0)
    drum(15, :bd_ada, [1], 0)
    drum(1, :bd_ada, [0.75, 0.25, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 0.5], 0)
    control phaser, mix: 0.1, phase: 32
    drum(208, :bd_ada, [2], 0)
    drum(1, :bd_ada, [0.5, 2.5, 1], 0)
    drum(31, :bd_ada, [2], 0)
    drum(1, :bd_ada, [1, 0.25, 0.25, 0.25, 0.25], 0)
    drum(32, :bd_ada, [2], 0)
  end
end

# SNARE
snare_loops = [{:sn_dolf => "....X.......X..."}, {:sn_dolf => "....X.......X.X."}, {:sn_dolf => "X.XXX.X.....X.X."}, {:sn_dolf => "....X...X...X.X."},
               {:sn_dolf => "....X.X.....X..."}, {:sn_dolf => "..X.X.....XXX.X."}, {:sn_dolf => "..X.X...X.XXX.X."}, {:sn_dolf => "....X.......X.XX"},
               {:sn_dolf => "..........XX..XX"}, {:sn_dolf => "..X.X.....X.X.X."}, {:sn_dolf => "....X..........."}]
snare_order = [[[0, 1], 19], [[0, 2, 0, 3, 0, 3, 4, 1, 5, 6], 1], [[0, 1], 7], [[0, 2], 1], [[0, 1], 3],[[0, 2, 0, 3, 0, 3, 4, 1, 5, 6], 1],
               [[0, 1], 11], [[0, 7, 8], 1], [[0, 1], 3], [[0, 2, 0, 3, 0, 3, 4, 1, 5, 9], 1], [[0, 1], 8], [[0, 10], 8]]
in_thread do
  sleep 65
  with_fx :ixi_techno, amp: 0.75, mix: 1, phase: 112, res: 0 do |phaser|
    drum(26, :sn_dolf, [2], 0)
    drum(1, :sn_dolf, [0.5, 1, 1, 0.5], 0)
    control phaser, mix: 0.1
    snare_order.each do |loops, repeat|
      repeat.times do
        loops.each do |i|
          16.times do |j|
            snare_loops[i].each do |samp, patt|
              sample samp, sustain: 0.12, amp: 0.6 if patt[j] == "X"
              sample :elec_filt_snare, sustain: 0.1 if patt[j] == "X"
            end
            sleep 0.25
          end
        end
      end
    end
  end
end

# CLAPS
in_thread do
  sleep 117.5
  drum(3, :elec_mid_snare, [1], 0.5)
  drum(66, :elec_mid_snare, [2], 0)
  2.times do
    drum(3, :elec_mid_snare, [1], 1)
    drum(62, :elec_mid_snare, [2], 0)
  end
  drum(14, :elec_mid_snare, [2], 4)
  drum(2, :elec_mid_snare, [2, 2, 1, 1, 1], 1)
  drum(26, :elec_mid_snare, [2], 0)
  drum(1, :elec_mid_snare, [2.25, 0.5, 1.25], 0)
  2.times do
    drum(2, :elec_mid_snare, [2, 2, 1, 1, 1], 1)
    drum(12, :elec_mid_snare, [2], 0)
  end
  drum(8, :elec_mid_snare, [2, 2, 1, 1, 1], 1)
end

# HI-HAT
in_thread do
  sleep 64.5
  with_fx :ixi_techno, amp: 0.75, mix: 1, phase: 112, res: 0 do |phaser|
    drum(50, :drum_cymbal_pedal, [1], 0.5)
    drum(1, :drum_cymbal_pedal, [0.5, 1.5, 0.5], 0)
    control phaser, mix: 0.1, phase: 32
    drum(323, :drum_cymbal_pedal, [1], 0)
    drum(96, :drum_cymbal_closed, [1], 4)
    drum(160, :drum_cymbal_pedal, [1], 0)
  end
end

# SHORT SPLASH CYMBAL
in_thread do
  sleep 102.5
  with_fx :compressor, amp: 0.8, clamp_time: 0.01, slope_below: 3 do
    drum(1, :drum_cymbal_open, [12, 2, 18, 32, 32, 32, 24, 8, 8, 4, 2, 10, 8, 8, 4, 20, 32, 14, 10, 8, 8, 4, 2, 10, 8, 8, 4, 28, 24, 24, 24, 12, 8, 8, 4, 2, 10, 8, 8, 4, 12, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8], 0)
  end
end

# BIG CRASH CYMBAL
in_thread do
  sleep 120
  drum(1, :drum_splash_hard, [128, 32, 32, 32, 32, 32, 32, 24, 24, 24, 25, 3, 32, 32, 32, 32], 0)
end
