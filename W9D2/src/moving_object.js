function MovingObject(option) {
    this.pos = option.pos;
    this.vel = option.vel;
    this.radius = option.radius;
    this.color = option.color;
    this.centerX = this.pos[0]
    this.centerY = this.pos[1]
}

MovingObject.prototype.draw = function (ctx) {
    console.log('drawing')
    ctx.fillStyle = this.color;
    ctx.beginPath();

    ctx.arc(
        this.centerX,
        this.centerY,
        this.radius,
        0,
        2 * Math.PI,
        false
    );
    ctx.fill();
}

// MovingObject.prototype.move = function () {
//     console.log('moving')
//     // console.log(cvs.width)
//     // console.log(cvs.height)
//     // while (this.centerX >= 0 && this.centerX <= cvs.width && this.centerY >= 0 && this.centerY <= cvs.height) {
//     this.centerX += this.vel[0]
//     this.centerY += this.vel[1]
//     // requestAnimationFrame(this.move(ctx, cvs))
//     // }
// }
MovingObject.prototype.move = function (x, y) {
    console.log('moving')
    // console.log(cvs.width)
    // console.log(cvs.height)
    // while (this.centerX >= 0 && this.centerX <= cvs.width && this.centerY >= 0 && this.centerY <= cvs.height) {
    this.centerX = (parseInt(this.centerX + this.vel[0]) % x);
    this.centerY = (parseInt(this.centerY + this.vel[1]) % y);
    // requestAnimationFrame(this.move(ctx, cvs))
    // }
}

module.exports = MovingObject

// const Circle =  function (centerX, centerY, radius, color) {
//     this.centerX = centerX;
//     this.centerY = centerY;
//     this.radius = radius;
//     this.color = color;
// };

// Circle.prototype.render = function (ctx) {
//     ctx.fillStyle = this.color;
//     ctx.beginPath();

//     ctx.arc(
//       this.centerX,
//       this.centerY,
//       this.radius,
//       0,
//       2 * Math.PI,
//       false
//     );

//     ctx.fill();
// };

