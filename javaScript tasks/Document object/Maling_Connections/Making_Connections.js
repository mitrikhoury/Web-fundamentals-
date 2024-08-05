var request = document.querySelector("#requests");
var connection= document.querySelector("#conn");
var username = document.querySelector("#username");

function accept(id) {
    var element = document.querySelector(id);
    element.remove();
    request.innerText--;
    connection.innerText++;
}

function ignore(id) {
    var element = document.querySelector(id);
    element.remove();
    request.innerText--;
}

function edit() {
    username.innerText = "Mitri khoury";
}