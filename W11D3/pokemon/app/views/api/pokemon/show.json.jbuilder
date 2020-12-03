json.pokemon do 
  json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type
  json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
end

json.pokeMoves do
  @pokemon.poke_moves.each do |poke_move|
    json.set! poke_move.id do
      json.extract! poke_move, :id, :move_id
      json.pokemon_id poke_move.pokemon.id
      # json.pokemon_id @pokemon, :id
    end
  end
end


json.moves do
    @pokemon.moves.each do |move|
        json.set! move.id do 
            json.extract! move, :id, :name
        end
    end
end

json.items do 
     @pokemon.items.each do |item|
        json.set! item.id do 
            json.extract! item, :id, :name, :pokemon_id, :price, :happiness
            # TODO check asset_path
            json.image_url asset_path("#{item.image_url}")
        end
    end
end