use_bpm 137

live_loop :filter_synth do
  use_synth :tb303
  use_synth_defaults release: 0.2, res: 0.9, cutoff_min: 110, cutoff: 130
  amps = [0.1, 1, 0.1, 0.5, 0.5]
  notes = [:E2, :Ds2, :Gs2, :Fs2]
  sleeps = [0.5, 0.25, 0.5, 0.25, 0.5]
  with_fx :ixi_techno, phase: 32, reps: 2, amp: 1.2 do
    notes.each do |n|
      2.times do
        amps.each do |a|
          play n, amp: a
          s = sleeps.shift
          sleep sleeps.push(s).last
        end
      end
    end
  end
end
