use_bpm 175

# Our F pattern of notes expressed in a play_pattern_timed method
def f_pattern
  play_pattern_timed [:F4, :C5, :F4, :F4, :C5, :F4, :F4, :C5,
                      :F4, :C5, :F4, :F4, :C5, :F4, :C5, :F4], [0.5]
end

# E pattern in a play_pattern_timed method
def e_pattern
  play_pattern_timed [:E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5,
                      :E4, :C5, :E4, :E4, :C5, :E4, :E4, :C5], [0.5]
end

# In the beginning of the song, the synthesizer alternates between the F and
# E patterns. Later on in the song, we're introduced to D and A patterns.
def d_pattern
  play_pattern_timed [:D4, :C5, :D4, :D4, :C5, :D4, :D4, :C5,
                      :D4, :C5, :D4, :D4, :C5, :D4, :C5, :D4], [0.5]
end

def a_pattern
  play_pattern_timed [:A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5,
                      :A4, :C5, :A4, :A4, :C5, :A4, :A4, :C5], [0.5]
end

# Let's put that all in a live_loop so that we can hear it again and again and again!
live_loop :rhythmic_synth do   # We have to give our live_loop a unique name
  
  use_synth_defaults release: 0.5   # use_synth_defaults allows us to change the
  # default attributes of the current synth. In this case, we're shortening the
  # `release` value from the default of 1 beat to 0.5 beats. In other words, we're
  # making the sound cut off sooner, which gives it more of a percussive, clipping
  # sound like The Postal Service's original.
  
  with_fx :panslicer, phase: 1 do   # with_fx allows us to manipulate our synth
    # sounds by adding various sound effects. panslicer is an effect that swings
    # the audio between the right and left channels. When you're listening with a
    # stereo setup (such as headphones), you'll hear the sound alternating from
    # one ear to the other. The `phase: 1` argument tells the panslicer that we want
    # it to make one complete cycle (right and then left) per beat. Since our
    # play_pattern_timed method is playing two notes per beat, the first note is
    # panned to the right and the second note to the left, just like The Postal
    # Service's original.
    
    with_fx :compressor, slope_above: 1, slope_below: 0.5 do
      # Don't worry too much about this for now –– compressor is just another sound
      # effect. It compresses the synth's sound, flattening out its dynamic range
      # (the range of amplitudes from soft to loud). I'm using it here to cause the
      # synth's sound to clip even more, making it even more percussive.
      
      f_pattern   # And, finally, we call our methods!
      e_pattern
      d_pattern
      a_pattern
      
    end   # Don't forget to end your loops! Any line of code that contains a `do`
  end     # MUST have a corresponding `end` later on. We need one `end` for each
end       # `with_fx` line and we also need to close our live_loop with an `end`.
