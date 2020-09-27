drum_patterns = {
  
  curr: {
    hat:   [5, 0, 0, 0,  5, 0, 0, 0,  5, 0, 0, 0,  5, 0, 0, 9],
    kick:  [9, 9, 0, 9,  0, 9, 0, 9,  0, 0, 0, 3,  0, 0, 0, 0],
    snare: [0, 0, 0, 0,  9, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]
  },
  basic: {
    hat:   [5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 5, 0,  5, 0, 0, 0],
    kick:  [9, 0, 9, 0,  0, 0, 0, 0,  9, 0, 0, 3,  0, 0, 0, 0],
    snare: [0, 0, 0, 0,  9, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]
  },
  swing: {
    hat:   [5, 0, 5, 0,  2, 0, 2, 0,  5, 0, 5, 0,  5, 0, 5, 0],
    kick:  [0, 9, 0, 9,  0, 0, 0, 0,  0, 9, 0, 3,  0, 0, 0, 0],
    snare: [0, 0, 0, 0,  9, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]
  },
  poly: {
    hat:   [5, 4, 3, 1,  0, 0, 9, 0, 0, 0, 0, 0, 0, 0],
    kick:  [9, 0, 0, 9,  9, 0, 0, 9],
    snare: [0, 1, 2, 3,  4, 5, 0, 5, 0, 5, 0, 0, 9, 0, 0]
  },
  polyBackUp: {
    hat:   [5, 4, 3, 1,  0, 0, 9, 0, 0],
    kick:  [9, 0, 0, 0,  9, 0, 0, 9],
    snare: [0, 1, 6, 0,  7, 0]
  }
}

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
    hat:   :elec_triangle,
    kick:  :elec_soft_kick,
    snare: :elec_hi_snare
  },
  toy: {
    hat:   :elec_tick,
    kick:  :elec_hollow_kick,
    snare: :elec_pop
  },
  house: {
    hat:   :perc_snap,
    kick:  :bd_haus,
    snare: :bd_zome
  },
  house2: {
    hat:   :perc_snap,
    kick:  :bd_haus,
    snare: :elec_pop
  }
  
  #kick: bd_ada, :bd_sone
  # trash: sn_generic
}

#####################################################################################################
set :bpm , 110
current_drum_kit = drum_kits[:house2]
current_drum_pattern = drum_patterns[:polyBackUp]

#fade masters:
set :hat_fac , 0.9
set :kick_fac, 0.9
set :snare_fac, 0.9
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
  sample current_drum_kit[:hat],       amp: current_drum_pattern[:hat][i_hat] * 0.9 * get[:hat_fac]
  sample current_drum_kit[:kick],      amp: current_drum_pattern[:kick][i_kick] * 0.9 * get[:kick_fac]
  sample current_drum_kit[:snare],     amp: current_drum_pattern[:snare][i_snare] *0.9 * get[:snare_fac]
end