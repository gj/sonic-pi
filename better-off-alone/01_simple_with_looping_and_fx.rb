use_bpm 137

live_loop :filter_synth do
  use_synth :tb303
  use_synth_defaults release: 0.2, res: 0.9, cutoff_min: 110, cutoff: 130
  
  with_fx :ixi_techno, phase: 32, reps: 2 do
    play :E2
    sleep 0.5
    play :E2
    sleep 0.25
    play :E2
    sleep 0.5
    play :E2
    sleep 0.25
    play :E2
    sleep 0.5
    
    play :E2
    sleep 0.5
    play :E2
    sleep 0.25
    play :E2
    sleep 0.5
    play :E2
    sleep 0.25
    play :E2
    sleep 0.5
    
    play :Ds2
    sleep 0.5
    play :Ds2
    sleep 0.25
    play :Ds2
    sleep 0.5
    play :Ds2
    sleep 0.25
    play :Ds2
    sleep 0.5
    
    play :Ds2
    sleep 0.5
    play :Ds2
    sleep 0.25
    play :Ds2
    sleep 0.5
    play :Ds2
    sleep 0.25
    play :Ds2
    sleep 0.5
    
    play :Gs2
    sleep 0.5
    play :Gs2
    sleep 0.25
    play :Gs2
    sleep 0.5
    play :Gs2
    sleep 0.25
    play :Gs2
    sleep 0.5
    
    play :Gs2
    sleep 0.5
    play :Gs2
    sleep 0.25
    play :Gs2
    sleep 0.5
    play :Gs2
    sleep 0.25
    play :Gs2
    sleep 0.5
    
    play :Fs2
    sleep 0.5
    play :Fs2
    sleep 0.25
    play :Fs2
    sleep 0.5
    play :Fs2
    sleep 0.25
    play :Fs2
    sleep 0.5
    
    play :Fs2
    sleep 0.5
    play :Fs2
    sleep 0.25
    play :Fs2
    sleep 0.5
    play :Fs2
    sleep 0.25
    play :Fs2
    sleep 0.5
  end
end
