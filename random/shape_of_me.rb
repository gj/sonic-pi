use_bpm(96)

chord_1  = [:Db5, :Ab4, :Db4]
chord_2  = [:E5, :Ab4, :Db4]
chord_3  = [:Db5, :Ab4, :Db4]
chord_4  = [:Db5, :A4, :Gb3]
chord_5  = [:E5, :A4, :Gb3]
chord_6  = [:Db5, :A4, :Gb3]
chord_7  = [:Db5, :A4, :A3]
chord_8  = [:E5, :A4, :A3]
chord_9  = [:Db5, :A4, :A3]
chord_10 = [:Eb5, :Gb4, :B3]
chord_11 = [:Db5, :Gb4, :B3]
chord_12 = [:B4, :Gb4, :B3]

def play_chords(chords)
  use_synth :piano
  
  with_synth_defaults amp: 1, sustain_level: 0.75, release: 0.5 do
    with_fx :reverb, room: 0.8 do
      with_fx :rlpf, cutoff: 100, res: 0.8 do
        
        play(chords[0])
        sleep 0.75
        play(chords[1])
        sleep 0.75
        play(chords[2])
        sleep 0.5
        
      end
    end
  end
end

live_loop :melody do
  play_chords([chord_1, chord_2, chord_3])
  play_chords([chord_4, chord_5, chord_6])
  play_chords([chord_7, chord_8, chord_9])
  play_chords([chord_10, chord_11, chord_12])
end

sleep 8
live_loop :beat do
  sample :bd_808, amp: 1
  sleep 0.75
  
  sample :bd_808, amp: 1
  sleep 0.70
  
  sample :perc_snap, amp: 0.6
  sleep 0.05
  
  sample :drum_snare_soft, amp: 0.4
  sleep 0.5
end

sleep 16

live_loop :hihats do
  sleep 0.5
  sample :drum_cymbal_soft, amp: 0.4
  sleep 0.5
  sample :drum_cymbal_pedal, amp: 0.4
end

sleep 24
live_loop :hh2 do
  sleep 0.5
  4.times do
    sample :drum_cymbal_closed, amp: 0.6
    sleep 0.125
  end
  sleep 3
end
