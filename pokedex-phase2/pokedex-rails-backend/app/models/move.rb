# == Schema Information
#
# Table name: moves
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_moves_on_name  (name) UNIQUE
#
class Move < ApplicationRecord
    validates :name, uniqueness: { message: "the name is already in use"}

    has_many :poke_moves,
    foreign_key: :move_id,
    class_name: :PokeMove,
    dependent: :destroy

    has_many :pokemon,
    through: :poke_moves,
    source: :pokemon
end
