// // // console.log('hello world');

// // const howToCount = () => {
// //   const fruit = 'banana';
// //   if (true) {
// //     const fruit = 'orange';
// //     console.log(fruit);
// //   }
// //   consold.log(fruit);
// // };

// // function howToLet() {
// //   let user = 'Walker';

// // }

// let i = 10;
// if (true) {
//   console.log(i);
// }

// let obj = {
//   a: 4,
//   b: 5,
//   a: function (ele) {
//     console.log(ele);
//   },
// };
// console.log(obj.a);

// function func(vari) {
//   console.log(vari);
// }

// // var func = function (vari) {
// //   console.log(vari);
// // };

// // let func = function (params) {
// //   console.log(params);
// // };
// // const func = function (params) {
// //   console.log(params);
// // };

// const functionName = (param) => {
//   console.log(param);
// };

// // functionName = 'hello';

// // console.log(functionName);

// // class ClassName {
// //   constructor(name, age) {
// //    //  this will be the obj
// //     this.name = name;
// //     this.age = age;
// //   }

// //   sayHi() {
// //     debugger;
// //     console.log(this.name, this.age);
// //   }
// // }

// // c = new ClassName('will', 33);
// // c.sayHi();

// // const callback = (object1, object2, object3, object4) => console.log(object1);

// // [1, 2, 3, 4].forEach(callback);

// const feed = (iva) => {
//   const foods = ['bananas'];
//   let val = (function (str) {
//     foods.forEach((ele) => {
//       console.log(ele, str);
//     });
//   })();
//   return val;
// };

// feed();

function cb(w) {
  let words = [];
  return function () {
    words.push(w);
    console.log(words);
  };
}

cb('hello')();