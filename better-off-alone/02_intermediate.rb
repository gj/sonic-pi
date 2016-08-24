live_loop :filter_synth do
  use_synth :tb303
  use_synth_defaults release: 0.2, res: 0.9, cutoff_min: 110, cutoff: 130
  
  with_fx :ixi_techno, phase: 32, reps: 2 do
    play_pattern_timed [:E2, :E2, :E2, :E2, :E2, :E2, :E2, :E2, :E2, :E2,
                        :Ds2, :Ds2, :Ds2, :Ds2, :Ds2, :Ds2, :Ds2, :Ds2, :Ds2, :Ds2,
                        :Gs2, :Gs2, :Gs2, :Gs2, :Gs2, :Gs2, :Gs2, :Gs2, :Gs2, :Gs2,
                        :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2], [0.5, 0.25, 0.5, 0.25, 0.5]
  end
end
