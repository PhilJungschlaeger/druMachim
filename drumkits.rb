drum_kits = {
  acoustic: {
    hat:   :drum_cymbal_closed,
    kick:  :drum_bass_hard,
    snare: :drum_snare_hard
  },
  acoustic_soft: {
    hat:   :drum_cymbal_closed,
    kick:  :drum_bass_soft,
    snare: :drum_snare_soft
  },
  electro: {
    hat:   :elec_tick, #:elec_flip,
    kick:  :elec_soft_kick,
    snare: :elec_hi_snare
  },
  house: {
    hat:   :perc_snap,
    kick:  :bd_haus,
    snare: :bd_zome # bd_ada, :elec_hi_snare
  },
# drum n bass
# cuttoff 100, snare, 110
# hat less loud
  drum_n_bass: {
    hat:   :drum_cymbal_closed,
    kick:  :bd_ada,
    snare: :elec_hi_snare, #:drum_snare_hard
  }
}