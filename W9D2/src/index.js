const Game = require('./game')
const GameView = require('./game_view')
const cb = () => {

    const canvas = document.getElementById("game-canvas");
    console.log(canvas)
    canvas.width = Game.DIM_X;
    canvas.height = Game.DIM_Y;
    const ctx = canvas.getContext('2d');
    const game = new Game();
    let gameView = new GameView(game, ctx)
    console.log(gameView)
    gameView.start()

    // const Game = require('./game.js')

    // canvasEl.height = window.innerHeight;
    // canvasEl.width = window.innerWidth;
    // new Game(
    //   canvasEl.width,
    //   canvasEl.height
    // ).start(canvasEl);
}

window.addEventListener('DOMContentLoaded', cb)