# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  attack     :integer          not null
#  captured   :boolean          default(FALSE), not null
#  defense    :integer          not null
#  image_url  :string           not null
#  name       :string           not null
#  number     :integer          not null
#  poke_type  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pokemons_on_name    (name) UNIQUE
#  index_pokemons_on_number  (number) UNIQUE
#
class Pokemon < ApplicationRecord

    TYPES = [
    'fire',
    'electric',
    'normal',
    'ghost',
    'psychic',
    'water',
    'bug',
    'dragon',
    'grass',
    'fighting',
    'ice',
    'flying',
    'poison',
    'ground',
    'rock',
    'steel'
    ].sort.freeze

    validates :image_url, presence: true
    validates :captured, inclusion: {in: %w(true false), message: "captured must be true or false"}
    validates :name, length: {in: 3..255}, uniqueness: {message: "'%{value}' is already in use"}
    validates :attack, :defense, numericality: {in: 0..100}
    validates :number, numericality: {greater_than: 0}, uniqueness:  {message: "'%{number}' is already in use"}
    validates :poke_type, inclusion: { in: TYPES, message: "'%{value}' is not a valid Pokemon type" }

    has_many :items,
    foreign_key: :pokemon_id,
    class_name: :Item,
    dependent: :destroy

    has_many :poke_moves,
    foreign_key: :pokemon_id,
    class_name: :PokeMove,
    dependent: :destroy

    has_many :moves,
    through: :poke_moves,
    source: :move
end

