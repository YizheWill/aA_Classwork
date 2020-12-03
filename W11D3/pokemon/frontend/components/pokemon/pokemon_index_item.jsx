import React from 'react'
import { Link } from "react-router-dom";


function PokemonIndexItem({pokemon}) {
    return (
      <li>
        <Link to={`/pokemon/${pokemon.id}`}>
            {pokemon.name} {pokemon.image_url}
        </Link>
      </li>
    )
}

export default PokemonIndexItem