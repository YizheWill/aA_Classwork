import React, { Component } from 'react'

export default class PokemonDetail extends Component {

  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.id)
  }



  render() {
    return (
      <div>
        
      </div>
    )
  }
}
