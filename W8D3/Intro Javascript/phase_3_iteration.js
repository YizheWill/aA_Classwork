Array.prototype.bubblesort = function () {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    this.forEach((element, idx) => {
      if (element > this[idx + 1]) {
        sorted = false;
        [this[idx], this[idx + 1]] = [this[idx + 1], this[idx]];
        // let temp = this[idx]
        // this[idx] = this[idx + 1]
        // this[idx+1] = temp
      }
    });
  }
  return this;
};

let array = [9, 7, 1, 3, 2];
console.log(array.bubblesort());

String.prototype.substring = function () {
  let result = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      result.push(this.slice(i, j));
    }
  }
  return result;
};
