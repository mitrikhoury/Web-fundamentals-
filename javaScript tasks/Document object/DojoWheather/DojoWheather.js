function Accept_cookie(id) {
    var element = document.querySelector(id);
    element.remove();
}
function celsiusToFahrenheit(celsius) {
    return Math.round((celsius * 9/5) + 32);
}

function fahrenheitToCelsius(fahrenheit) {
    return Math.round((fahrenheit - 32) * 5/9);
}


function convert(element) {
    console.log(element.value);
    for(var i=1; i<9; i++) {
        var tempSpan = document.querySelector("#t" + i);
        var tempValue = parseInt(tempSpan.innerText);
        if(element.value == "°C") {
            tempSpan.innerText = fahrenheitToCelsius(tempValue)+"°";
        } else {
            tempSpan.innerText = celsiusToFahrenheit(tempValue)+"°";
        }
    }
}