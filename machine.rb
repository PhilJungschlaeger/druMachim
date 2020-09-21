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
  test: {
    hat:   [5, 0, 5, 0,  9],
    kick:  [0, 9, 0, 9, 9],
    snare: [0, 0, 0, 0,  9, 0, 0, 2,  0, 1, 0, 0,  9, 0, 0, 1]
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
  }
}
#####################################################################################################
#params:
set :bpm , 80
current_drum_kit = drum_kits[:acoustic_soft]
current_drum_pattern = drum_patterns[:swing]
#####################################################################################################
set :patern_length, current_drum_pattern[:hat].length

live_loop :pulse do
  use_bpm get(:bpm)
  sleep 0.25
end

in_thread(name: :iterator) do
  set :it, 0
  loop do
    sync :pulse
    set :it, (get[:it]+1) % get[:patern_length]
  end
end

live_loop :machine do
  i = get[:it]
  sync :pulse
  sample current_drum_kit[:hat],       amp: current_drum_pattern[:hat][i] * 0.9
  sample current_drum_kit[:kick],      amp: current_drum_pattern[:kick][i] * 0.9
  sample current_drum_kit[:snare],     amp: current_drum_pattern[:snare][i] *0.9
end