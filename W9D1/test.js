function Animal(name) {
  this.name = name;
}

Animal.prototype.sayHello = function () {
  console.log(this.name, 'hello world');
};

function Dog(name) {
  Animal.apply(this, [name]);
}
function Cat(name) {
  Animal.apply(this, [name]);
}

// class Dog extends Animal {
//   constructor(name) {
//     super(name);
//   }
//   woof() {
//     console.log('woof');
//   }
// }
// class Cat extends Animal {
//   constructor(name) {
//     super(name);
//   }
// }
Dog.prototype = { ...Animal.prototype, constructor: Dog };
Cat.prototype = { ...Animal.prototype, constructor: Cat };
c = new Cat('cc');
c.sayHello();
