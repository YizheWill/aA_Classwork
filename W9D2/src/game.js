const Asteroid = require('./asteroid')

function Game() {
    this.asteroids = [];

    this.addAsteroid();
};
// cvs.height = window.innerHeight;
// cvs.width = window.innerWidth;
Game.DIM_X = window.innerWidth;
Game.DIM_Y = window.innerHeight;
Game.NUM_ASTEROIDS = 20;

Game.prototype.randomPosition = function () {
    // let num = Math.random()
    // if (num < 2.5)
    //     return [0, Math.random() * Game.DIM_Y]
    // else if (num >= 2.5 && num < 5)
    //     return [Game.DIM_X, Math.random() * Game.DIM_Y]
    // else if (num < 7.5)
    //     return [Math.random() * Game.DIM_X, 0]
    // else
    //     return [Math.random() * Game.DIM_X, Game.DIM_Y]
    // let y = Math.random() * Game.DIM_Y;
    let x = Math.random() * Game.DIM_X
    let y = Math.random() * Game.DIM_Y
    return [x, y]
}

Game.prototype.addAsteroid = function () {
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
        this.asteroids.push(new Asteroid({ pos: this.randomPosition() }))
    }
}

Game.prototype.moveObjects = function () {
    console.log(this.asteroids)
    for (let i = 0; i < this.asteroids.length; i++) {
        console.log(this.asteroids[i])
        this.asteroids[i].move(Game.DIM_X, Game.DIM_Y);
    }
}

Game.prototype.draw = function (ctx) {
    console.log(ctx)
    console.log(this.asteroids)
    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y)
    for (let i = 0; i < this.asteroids.length; i++) {
        console.log('drawing one')
        this.asteroids[i].draw(ctx)
    }
}

Game.prototype.wrap = function (pos) {

}


module.exports = Game;