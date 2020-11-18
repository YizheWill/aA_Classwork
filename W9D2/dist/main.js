/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is not neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\")\n\nfunction Asteroid(option) {\n    // Asteroid.COLOR: 'black';\n    // Asteroid.RADIUS: () => Math.ceil((Math.random * 10));\n    option.color = Asteroid.COLOR;\n    option.radius = Asteroid.RADIUS;\n    option.vel = Util.randomVec(10);\n    // this.radius = Asteroid.RADIUS;\n    MovingObject.call(this, option)\n}\n\nAsteroid.COLOR = 'green'\nAsteroid.RADIUS = 5\n\n\nUtil.inherits(Asteroid, MovingObject)\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\")\n\nfunction Game() {\n    this.asteroids = [];\n\n    this.addAsteroid();\n};\n// cvs.height = window.innerHeight;\n// cvs.width = window.innerWidth;\nGame.DIM_X = window.innerWidth;\nGame.DIM_Y = window.innerHeight;\nGame.NUM_ASTEROIDS = 20;\n\nGame.prototype.randomPosition = function () {\n    // let num = Math.random()\n    // if (num < 2.5)\n    //     return [0, Math.random() * Game.DIM_Y]\n    // else if (num >= 2.5 && num < 5)\n    //     return [Game.DIM_X, Math.random() * Game.DIM_Y]\n    // else if (num < 7.5)\n    //     return [Math.random() * Game.DIM_X, 0]\n    // else\n    //     return [Math.random() * Game.DIM_X, Game.DIM_Y]\n    // let y = Math.random() * Game.DIM_Y;\n    let x = Math.random() * Game.DIM_X\n    let y = Math.random() * Game.DIM_Y\n    return [x, y]\n}\n\nGame.prototype.addAsteroid = function () {\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n        this.asteroids.push(new Asteroid({ pos: this.randomPosition() }))\n    }\n}\n\nGame.prototype.moveObjects = function () {\n    console.log(this.asteroids)\n    for (let i = 0; i < this.asteroids.length; i++) {\n        console.log(this.asteroids[i])\n        this.asteroids[i].move(Game.DIM_X, Game.DIM_Y);\n    }\n}\n\nGame.prototype.draw = function (ctx) {\n    console.log(ctx)\n    console.log(this.asteroids)\n    ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y)\n    for (let i = 0; i < this.asteroids.length; i++) {\n        console.log('drawing one')\n        this.asteroids[i].draw(ctx)\n    }\n}\n\nGame.prototype.wrap = function (pos) {\n\n}\n\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

eval("\nfunction GameView(game, ctx) {\n    this.game = game;\n    this.ctx = ctx;\n}\n\nGameView.prototype.start = function () {\n    setInterval(() => {\n        console.log(this.game)\n        this.game.moveObjects();\n        this.game.draw(this.ctx);\n    }, 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/*! CommonJS bailout: module.exports is used directly at 47:0-14 */
/***/ ((module) => {

eval("function MovingObject(option) {\r\n    this.pos = option.pos;\r\n    this.vel = option.vel;\r\n    this.radius = option.radius;\r\n    this.color = option.color;\r\n    this.centerX = this.pos[0]\r\n    this.centerY = this.pos[1]\r\n}\r\n\r\nMovingObject.prototype.draw = function (ctx) {\r\n    console.log('drawing')\r\n    ctx.fillStyle = this.color;\r\n    ctx.beginPath();\r\n\r\n    ctx.arc(\r\n        this.centerX,\r\n        this.centerY,\r\n        this.radius,\r\n        0,\r\n        2 * Math.PI,\r\n        false\r\n    );\r\n    ctx.fill();\r\n}\r\n\r\n// MovingObject.prototype.move = function () {\r\n//     console.log('moving')\r\n//     // console.log(cvs.width)\r\n//     // console.log(cvs.height)\r\n//     // while (this.centerX >= 0 && this.centerX <= cvs.width && this.centerY >= 0 && this.centerY <= cvs.height) {\r\n//     this.centerX += this.vel[0]\r\n//     this.centerY += this.vel[1]\r\n//     // requestAnimationFrame(this.move(ctx, cvs))\r\n//     // }\r\n// }\r\nMovingObject.prototype.move = function (x, y) {\r\n    console.log('moving')\r\n    // console.log(cvs.width)\r\n    // console.log(cvs.height)\r\n    // while (this.centerX >= 0 && this.centerX <= cvs.width && this.centerY >= 0 && this.centerY <= cvs.height) {\r\n    this.centerX = (parseInt(this.centerX + this.vel[0]) % x);\r\n    this.centerY = (parseInt(this.centerY + this.vel[1]) % y);\r\n    // requestAnimationFrame(this.move(ctx, cvs))\r\n    // }\r\n}\r\n\r\nmodule.exports = MovingObject\r\n\r\n// const Circle =  function (centerX, centerY, radius, color) {\r\n//     this.centerX = centerX;\r\n//     this.centerY = centerY;\r\n//     this.radius = radius;\r\n//     this.color = color;\r\n// };\r\n\r\n// Circle.prototype.render = function (ctx) {\r\n//     ctx.fillStyle = this.color;\r\n//     ctx.beginPath();\r\n\r\n//     ctx.arc(\r\n//       this.centerX,\r\n//       this.centerY,\r\n//       this.radius,\r\n//       0,\r\n//       2 * Math.PI,\r\n//       false\r\n//     );\r\n\r\n//     ctx.fill();\r\n// };\r\n\r\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

eval("const Util = {\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n}\n\nUtil.inherits = function (childClass, parentClass) {\n    function Surrogate() {};\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n    // childClass.prototype = { ...parentClass.prototype, constructor: childClass };\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\")\r\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\")\r\nconst cb = () => {\r\n\r\n    const canvas = document.getElementById(\"game-canvas\");\r\n    console.log(canvas)\r\n    canvas.width = Game.DIM_X;\r\n    canvas.height = Game.DIM_Y;\r\n    const ctx = canvas.getContext('2d');\r\n    const game = new Game();\r\n    let gameView = new GameView(game, ctx)\r\n    console.log(gameView)\r\n    gameView.start()\r\n\r\n    // const Game = require('./game.js')\r\n\r\n    // canvasEl.height = window.innerHeight;\r\n    // canvasEl.width = window.innerWidth;\r\n    // new Game(\r\n    //   canvasEl.width,\r\n    //   canvasEl.height\r\n    // ).start(canvasEl);\r\n}\r\n\r\nwindow.addEventListener('DOMContentLoaded', cb)\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;