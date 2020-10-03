#todo:
# - allow patterns with muliple lines
# - prepare drone machine
# - make a lib of rhythms
# - sth like e orgel?
# - make effects available (cutoff,..)
# - configs (rhythm, sample, loudness, effects)

drum_patterns = {
  tmp: {
    hat:   [5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0],
    kick:  [0, 9, 0, 9,  0, 0, 0, 0,  0, 9, 0, 3,  0, 0, 0, 0],
    snare: [0, 0, 0, 0,  9, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]
  },
  poly2: {
    hat:   [5, 4, 3, 1,  0, 0, 9, 0, 0],
    kick:  [9, 0, 0, 0,  1, 0, 0, 9],
    snare: [0, 0, 0, 0,  7, 0]
  },
  drum_n_bass: {
    hat:   [9, 0, 9, 0,  9, 0, 9, 0,  9, 0, 7, 2,  9, 2, 9, 0],
    kick:  [9, 0, 0, 0,  0, 0, 0, 0,  0, 0, 9, 0,  0, 0, 0, 0],
    snare: [0, 0, 0, 0,  9, 0, 0, 0,  0, 0, 0, 0,  9, 0, 0, 0]
  }
}

drum_kits = {
  tmp: {
    hat:   :elec_tick, #:elec_flip,
    kick:  :elec_soft_kick,
    snare: :elec_hi_snare
  },
  drum_n_bass: {
    hat:   :drum_cymbal_closed,
    kick:  :bd_ada,
    snare: :elec_hi_snare, #:drum_snare_hard
  }
}

#hashes:
pattern_h = drum_patterns.keys
kit_h = drum_kits.keys
#####################################################################################################
set :bpm , 180

#by name:
#current_drum_kit = drum_kits[:house]
#current_drum_pattern = drum_patterns[:tech]

#by index
current_drum_kit = drum_kits[kit_h[0]]
current_drum_pattern = drum_patterns[pattern_h[2]]

#fade masters:
set :hat_fac , 0.2
set :kick_fac, 0.9
set :snare_fac, 0.9

set :hat_coff, 100
set :kick_coff, 130
set :snare_coff, 110
#####################################################################################################

live_loop :pulse do # simple pulse, to synch
  use_bpm get(:bpm)
  sleep 0.25
end

set :hat_patern_length, current_drum_pattern[:hat].length
set :kick_pattern_length, current_drum_pattern[:kick].length
set :snare_pattern_length, current_drum_pattern[:snare].length
in_thread(name: :iterator) do  # to stay in correct beat/pos
  set :it_hat, 0
  set :it_kick, 0
  set :it_snare, 0
  loop do
    sync :pulse
    set :it_hat, ((get[:it_hat]+1) % get[:hat_patern_length])
    set :it_kick, ((get[:it_kick]+1) % get[:kick_pattern_length])
    set :it_snare, ((get[:it_snare]+1) % get[:snare_pattern_length])
  end
end


live_loop :machine do
  i_hat = get[:it_hat]
  i_kick = get[:it_kick]
  i_snare = get[:it_snare]
  sync :pulse
  sample current_drum_kit[:hat],       amp: current_drum_pattern[:hat][i_hat] * 0.9 * get[:hat_fac], cutoff: get[:hat_coff]
  sample current_drum_kit[:kick],      amp: current_drum_pattern[:kick][i_kick] * 0.9 * get[:kick_fac], cutoff: get[:kick_coff]#, hpf: 20
  sample current_drum_kit[:snare],     amp: current_drum_pattern[:snare][i_snare] *0.9 * get[:snare_fac], cutoff: get[:snare_coff] #cutoff: 100
end