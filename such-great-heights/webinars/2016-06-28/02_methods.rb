use_bpm 175

def f_c       # Here we define a custom method called f_c (so-named because it first
  play :F4    # plays an F note and then a C note). After we define the new method,
  sleep 0.5   # every time Sonic Pi sees those three characters (f_c) it will run
  play :C5    # the code contained within the body of the method (play :F4 / sleep 0.5
  sleep 0.5   # / play :C5 / sleep 0.5).
end

def f         # Same as above, here we're defining a method called f that plays an
  play :F4    # F note and then sleeps for 0.5 beats. Defining methods like these
  sleep 0.5   # allows us to greatly simplify and better organize our code, while also
end           # making it easier to recycle and reuse repeated sequences.

# FIRST MEASURE (first set of 8 notes)
f_c
f
f_c
f
f_c

# SECOND MEASURE (next set of 8 notes)
f_c
f
f_c
f_c
f
