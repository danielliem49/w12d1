# == Schema Information
#
# Table name: poke_moves
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  move_id    :bigint           not null
#  pokemon_id :bigint           not null
#
# Indexes
#
#  index_poke_moves_on_move_id                 (move_id)
#  index_poke_moves_on_pokemon_id_and_move_id  (pokemon_id,move_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (move_id => moves.id)
#  fk_rails_...  (pokemon_id => pokemons.id)
#
class PokeMove < ApplicationRecord
    validates :move_id, uniqueness: {scope: :pokemon_id, message: "pokemon cannot have the same move more than once"}

    belongs_to :move,
    foreign_key: :move_id,
    class_name: :Move

    belongs_to :pokemon,
    foreign_key: :pokemon_id,
    class_name: :Pokemon


end
