const Util = {
    randomVec(length) {
        const deg = 2 * Math.PI * Math.random();
        return Util.scale([Math.sin(deg), Math.cos(deg)], length);
    },
    scale(vec, m) {
        return [vec[0] * m, vec[1] * m];
    }
}

Util.inherits = function (childClass, parentClass) {
    function Surrogate() {};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
    // childClass.prototype = { ...parentClass.prototype, constructor: childClass };
}

module.exports = Util;