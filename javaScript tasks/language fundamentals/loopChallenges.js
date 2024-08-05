console.log("1) print values from 1 up to 20");
for(var i=1 ; i<=20 ; i++){
    if(i % 2 != 0){  // odd number 
      console.log("odd number :" + i);
    }
}

console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
console.log("Decreasing Multiples of 3");
for(var i=100;i>0;i -=3){
    console.log("2) Decreasing number by 3 :" +i);
}

console.log("****************************");
console.log("3) Print the sequence");
for( var i=4 ; i>= -3.5; i -=1.5){
    console.log(i);
}

console.log("^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
console.log("sigma");
var sum = 0;
for(var i = 1 ; i<=100 ; i++){
     sum += i;
}
console.log("the result :" + sum);
console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
console.log("Factorial");
var product = 1;
for( i = 1; i <= 12 ; i++){
   product *= i; 
}
console.log("the result : " + product);

