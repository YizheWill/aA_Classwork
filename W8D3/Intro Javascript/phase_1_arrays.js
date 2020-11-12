


Array.prototype.uniq = function() {
  let seen = {};
  let res = []
  this.forEach(el => {
    if (!seen[el]) {
      seen[el] = true
      res.push(el)
    }
  });
  return res;
}

// Array.prototype.twoSum = function() {
//     let hash = {};
//     let res = [];
//     this.forEach((ele,idx) => {
//         if (hash[ele]) {
//             hash[ele].push(idx)
//         }
//         else {hash[ele] = [idx]}
//     })
//     this.forEach((e,i) => {
//         if (hash[-e]) {
//         //careful about the concat, it's not mutating the res!!!
//             res = res.concat(createpair(hash[-e],i))
//         }
//     })
//     return res;
// }


// function createpair(arr,idx) {
//     let res = [];
//     arr.forEach(ele => {
//         if (idx !== ele) {
//             res.push([idx,ele])
//         }
//     }) 
//     return res;
// }

let arr = [1,2,-1,-2]
console.log(arr.twoSum())

Array.prototype.twoSum = function() {
  let newArray = [];
  this.forEach((el1, idx1)=>{
    this.forEach((el2, idx2) => {
      if (idx2 !== idx1 && el2 + el1 === 0) {
        newArray.push([idx1, idx2])        
      }
    })
  })
  return newArray
}
// [[1,2,3], [1,2,3]] => [[1,1],[2,2], [3,3]]
Array.prototype.transpose = function() {
  let newArray = []
  let arr = []
  let i = 0
  while (i < this[0].length) {
    this.forEach((subArray) => {
      arr.push(subArray[i]);
    })
    newArray.push(arr);
    arr = []
    i+=1;
  }
  return newArray;
}

