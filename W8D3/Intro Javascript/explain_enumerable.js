// I tried to re-write the method we were building. it's easier to understand this way.
Array.prototype.myReduce = function (cb, optional) {
  let array = this;
  if (optional == undefined) {
    optional = this[0];
    array = this.slice(1);
  }
  array.myEach((el) => {
    optional = cb(optional, el);
  });
  return optional;
};

console.log((res = [1, 2, 3].myReduce((a, b) => a + b, 7)));
console.log((res = [1, 2, 3].myReduce((a, b) => a + b)));
// it works.

// Then I am thinking about how to pass in a default optional
let array = [1, 2, 3];
const cb = (a, b) => a + b;
// expect array.myReduce() => 6
Array.prototype.myReduce = function (cb, optional = this[0]) {
  // js won't forbid us from passsing this[0], which is good.
  Array.forEach((el) => {
    // could be problematic here, on the first round
    // myReduce doesn't know whether there is an optional passed in or not,
    // because we give optional a default value, there will always be a value when program looks for variable 'optional' in it's block.
    // but our program have different logic dealing with [1,2,3].reduce(1) and [1,2,3].reduce()
    // as [1,2,3].reduce(1) should return 7, but [1,2,3].reduce() should return 6. the result depends on whether there is a optional passed in.
    // but our program, after feeding a default value, will always work as [1,2,3].reduce(1).
    optional = cb(optional, el);
  });
  return optional;
};

console.log(array.myReduce(cb));
