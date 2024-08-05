function alwaysHungry(arr) {
    var counter=0;
    for(var i =0 ; i < arr.length ; i++){
        if(arr[i] == "food"){
            console.log("yummy");
            counter++;
        }
    }
    if(counter == 0){
        console.log("I'm hungry")
    }
}
   
alwaysHungry([3.14, "food", "pie", true, "food"]);
// this should console log "yummy", "yummy"
alwaysHungry([4, 1, 5, 7, 2]);
// this should console log "I'm hungry"'

function highPass(arr, cutoff) {
    var filteredArr = [];
   for(var i = 0 ; i< arr.length;i++){
    if(arr[i] > cutoff){
        filteredArr.push(arr[i]);
     }
   }
    return filteredArr;
}
var result = highPass([6, 8, 3, 10, -2, 5, 9], 5);
console.log("*****");
console.log(result); // we expect back [6, 8, 10, 9]
console.log("****");

function betterThanAverage(arr) {
    var sum = 0;
    var count = 0
    // calculate the average
    for(var i = 0 ; i< arr.length;i++){
        sum+= arr[i];  
    }
    var avg = sum / arr.length;
    for(var i = 0 ; i< arr.length;i++){
     if(arr[i] > avg){
        count++;
     }
    }
    // count how many values are greated than the average
    return count;
}
var result = betterThanAverage([6, 8, 3, 10, -2, 5, 9]);
console.log(result); // we expect back 4
console.log("****");

function reverse(arr) {
    var newarr =[];
    for(var i=arr.length -1; i>=0 ; i--){
        newarr.push(arr[i]);
    }
     return newarr;
}
   
var result = reverse(["a", "b", "c", "d", "e"]);
console.log(result); // we expect back ["e", "d", "c", "b", "a"]
console.log("****");

function fibonacciArray(n) {
    // the [0, 1] are the starting values of the array to calculate the rest from
    var fibArr = [0, 1];
    // your code here
    for (var i = 2; i < n; i++) {
        fibArr.push(fibArr[i - 1] + fibArr[i - 2]);
    }
    return fibArr;
}

var result = fibonacciArray(10);
console.log(result); // we expect back [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
