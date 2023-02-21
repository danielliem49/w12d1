# [
#   {
#     "id": 1,
#     "number": 1,
#     "name": "Bulbasaur",
#     "imageUrl": "/images/pokemon_snaps/1.svg",
#     "captured": true
#   },
#   // ...
# ]



json.array! @pokemons, :id, :number, :name, :image_url, :captured

# json.array! @pokemons.each do |pokemon|
#     if !pokemon.captured

#     end
# end


# @pokemons.each do |pokemon|
#     json.set! pokemon.id
#     json.extract! pokemon, :id, :number, :name, :image_url, :captured
# end