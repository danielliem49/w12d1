# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  happiness  :integer          not null
#  image_url  :string           not null
#  name       :string           not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pokemon_id :bigint           not null
#
# Indexes
#
#  index_items_on_pokemon_id  (pokemon_id)
#
# Foreign Keys
#
#  fk_rails_...  (pokemon_id => pokemons.id)
#
class Item < ApplicationRecord
    validates :happiness, :image_url, presence: true
    validates :name, length: {maximum: 255}
    validates :price, numericality: {greater_than_or_equal_to: 0} 

    belongs_to :pokemon,
    foreign_key: :pokemon_id,
    class_name: :Pokemon
    
end
