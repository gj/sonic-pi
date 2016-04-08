# Blog Brainstorm
1. Should I cover the basics? Or just blanket refer to the (awesome) Sonic Pi help documentation?
1. Process
  1. Pick a song.
    1. Songs with fixed, repetitive sections are **much** easier to code than freeform styles, such as jazz.
    2. Computers are very good at doing repetitive tasks
    3. Making a note-for-note, beat-for-beat Sonic Pi arrangement of a song is a seriously impressive undertaking, but efficiency is the dream. Play to Sonic Pi's strengths and challenge yourself to look for patterns in the music.
  2. Find a midi file / piano/guitar tab / etc.
  3. Set up your Sonic Pi environment
    1. use_bpm
    2. Create a framework: block out a section for each instrument (e.g., drums, rhythm guitar, lead synthesizer, bass, etc.)
    3. live_loop vs. in_thread vs. ???
  4. Choose a workflow that feels comfortable to you
    1. While working on "Such Great Heights," I decided to create the sound of each instrument first, before filling in the notes/patterns/etc.
      * Allowed me to figure out the echo/normalizer chain for the bass
      * Definitely went back later to tweak sounds, but, by making them sound roughly like the original song before I started filling in notes, it helped me find errors in the MIDI file as I was coding along.
      * There's by no means a **right** way to do this - you should go with whatever feels the most intuitive to you. But I can't stress enough how much having a system (tweak sound and then write notes for each instrument) helped with maintaining some semblance of organization in the project.
  5. For this walkthrough, we'll follow my strategy and begin by coding the sounds
    1. Use live_loop to loop a sequence of notes as you tweak the audio settings
