function pizzaOven (crustType , sauceType ,cheeses ,toppings){
   var pizza ={};
   pizza.crustType = crustType;
   pizza.sauceType = sauceType;
   pizza.cheeses = cheeses;
   pizza.toppings = toppings;
   return pizza;
}
var pizza1 = pizzaOven("deep dish","traditional",["mozzarella"],["pepperoni", "sausage"]);
console.log("obj 1"+ pizza1.crustType);
var pizza2 = pizzaOven("hand tossed","marinara",["mozzarella", "feta"],["mushrooms", "olives", "onions"]);
console.log("obj 2 toppings" + pizza2.toppings);