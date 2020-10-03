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
# drum n bass # cuttoff: 100, 100, 110 # hat less loud
  drum_n_bass: {
    hat:   :drum_cymbal_closed,
    kick:  :bd_ada,
    snare: :elec_hi_snare, #:drum_snare_hard
  },
  # footwork # cutof: 100, 70, 80 # facs: 0.9, 0.9, 0.5
  footwork: {
    hat:   :elec_plip,
    kick:  :bd_ada,
    snare: :perc_snap
  },
  # puma # cutof: 100, 80, 120  # facs: 0.2, 0.5, 0.9
  puma: {
    hat:   :drum_cymbal_closed,
    kick:  :bd_ada,
    snare: :elec_twip
  }
}