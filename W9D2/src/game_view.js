
function GameView(game, ctx) {
    this.game = game;
    this.ctx = ctx;
}

GameView.prototype.start = function () {
    setInterval(() => {
        console.log(this.game)
        this.game.moveObjects();
        this.game.draw(this.ctx);
    }, 20);
}

module.exports = GameView;