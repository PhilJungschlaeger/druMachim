#todo:
# - lofi beat
# - basic goa
# - minimal
# - baltimore
# - trip hop?
# - dub step
# - reggae
# - house
# - R & B
# - Jazz
# - blues

drum_patterns = {
    basic: {
        hat:   [5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0],
        kick:  [9, 0, 9, 0,  0, 0, 0, 0,  9, 0, 0, 3,  0, 0, 0, 0],
        snare: [0, 0, 0, 0,  9, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]
    },
    swing: {
        hat:   [5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0],
        kick:  [0, 9, 0, 9,  0, 0, 0, 0,  0, 9, 0, 3,  0, 0, 0, 0],
        snare: [0, 0, 0, 0,  9, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]
    },
    # drum n bass  # :bmp, 168 - 178 # with kit: drumnbass or electro
    # https://www.attackmagazine.com/technique/beat-dissected/raw-drum-bass/
    drum_n_bass: {
        hat:   [9, 0, 9, 0,  9, 0, 9, 0,  9, 0, 7, 2,  9, 2, 9, 0],
        kick:  [9, 0, 0, 0,  0, 0, 0, 0,  0, 0, 9, 0,  0, 0, 0, 0],
        snare: [0, 0, 0, 0,  9, 0, 0, 0,  0, 0, 0, 0,  9, 0, 0, 0]
    },
    poly: {
        hat:   [5, 4, 3, 1,  0, 0, 9, 0, 0],
        kick:  [9, 0, 0, 0,  1, 0, 0, 9],
        snare: [0, 0, 0, 0,  7, 0]
    },
    # foot work # at 140 bpm (langsamer bei 100bpm auch ganz nice)
    # https://blog.zzounds.com/2016/02/16/beat-connection-footwork/#prettyPhoto 
    footwork: {
    hat:   [9, 0, 0, 9,  0, 0, 0, 9,  0, 9, 9, 9,  9, 9, 0, 9,  9, 0, 0, 9,  0, 0, 0, 9,  1, 9, 9, 9,  9, 9, 0, 9],
    kick:  [0, 0, 0, 0,  0, 0, 9, 0,  0, 0, 9, 0,  9, 0, 0, 0,  9, 0, 0, 0,  0, 0, 9, 0,  0, 0, 9, 0,  9, 0, 0, 0],
    snare: [0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 9,  9, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  9, 0, 0, 0]
  },  
  # puma # at 70 bpm(bei 100 auch ganz nice)
  puma: {
    hat:   [9, 0, 0, 9,  9, 0, 5, 0,  9, 0, 5, 0,  9, 0, 5, 0],
    kick:  [9, 0, 0, 0,  0, 0, 0, 0,  0, 9, 0, 0,  0, 9, 0, 0],
    snare: [0, 0, 0, 0,  9, 0, 0, 0,  0, 0, 0, 0,  9, 0, 0, 0]
  },
}