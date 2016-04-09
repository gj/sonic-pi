# Piano Version
use_bpm 175

in_thread(name: :opening_left_hand) do
  # measures 1-2
  4.times do
    play :F3
    sleep 0.5
    play :C4
    sleep 0.5
    play :A3
    sleep 1
  end

  # measure 3
  play :C3
  sleep 0.5
  play :C4
  sleep 0.5
  play :G3
  sleep 1

  play :E3
  sleep 0.5
  play :C4
  sleep 0.5
  play :G3
  sleep 1

  # measure 4
  2.times do
    play :C3
    sleep 0.5
    play :C4
    sleep 0.5
    play :G3
    sleep 1
  end

  # measure 5-6
  4.times do
    play :Bb2
    sleep 0.5
    play :G3
    sleep 0.5
    play :F3
    sleep 1
  end

  # measure 7
  2.times do
    play :F3
    sleep 0.5
    play :C4
    sleep 0.5
    play :A3
    sleep 1
  end

  # measure 8
  play :C3
  sleep 0.5
  play :C4
  sleep 0.5
  play :G3
  sleep 1

  play :E3
  sleep 0.5
  play :C4
  sleep 0.5
  play :G3
  sleep 1
end

in_thread(name: :opening_right_hand) do
  play :F4
  sleep 1.5
  play :A4
  sleep 2
  play :F4
  sleep 2
  play :F4
  sleep 2.5

  play :E4
  sleep 1.5
  play :C5
  sleep 2
  play :E4
  sleep 2
  play :C5
  sleep 2.5

  play :C4
  sleep 1.5
  play :E4
  sleep 2
  play :C4
  sleep 2
  play :E4
  sleep 2.5
end
