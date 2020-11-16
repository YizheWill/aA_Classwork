// function range(start, end) {
//   if (start <= end) {
//     return [start].concat(range(start + 1, end));
//   } else {
//     return [];
//   }
// }

const range = (start, end) =>
  start <= end ? [start].concat(range(start + 1, end)) : [];

console.log(range(1, 5));

const sumRec = (arr) => (arr.length === 0 ? 0 : arr[0] + sumRec(arr.slice(1)));

console.log(sumRec([1, 2, 3, 4]));

const exponent1 = (base, exp) =>
  exp === 0 ? 1 : base * exponent1(base, exp - 1);

console.log(exponent1(2, 3));

const exponent2 = (base, exp) => {
  if (exp === 0) return 1;
  return exp % 2
    ? base * exponent2(base, (exp - 1) / 2) ** 2
    : exponent2(base, exp / 2) ** 2;
};

console.log(exponent2(2, 3));
console.log(exponent2(2, 4));

const fibonacci = (n) => {
  if (n === 1 || n === 0) return [1];
  if (n === 2) return [1, 1];
  let temp = fibonacci(n - 1);
  temp.push(temp.slice(-2).reduce((a, b) => a + b));
  return temp;
};
console.log(fibonacci(5));

const deepDup = (arr) => {
  if (arr.length === 0) return [];
  return Array.isArray(arr) ? arr.map((element) => deepDup(element)) : arr;
};
