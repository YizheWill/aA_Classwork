const MovingObject = require('./moving_object')
const Util = require('./utils')

function Asteroid(option) {
    // Asteroid.COLOR: 'black';
    // Asteroid.RADIUS: () => Math.ceil((Math.random * 10));
    option.color = Asteroid.COLOR;
    option.radius = Asteroid.RADIUS;
    option.vel = Util.randomVec(10);
    // this.radius = Asteroid.RADIUS;
    MovingObject.call(this, option)
}

Asteroid.COLOR = 'green'
Asteroid.RADIUS = 5


Util.inherits(Asteroid, MovingObject)

module.exports = Asteroid;