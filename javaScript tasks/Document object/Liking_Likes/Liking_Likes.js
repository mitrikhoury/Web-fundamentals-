var likeArray =[9,12,9];

var texts = [
    document.querySelector("#box-1-like"),
    document.querySelector("#box-2-like"),
    document.querySelector("#box-3-like")
];

function liked(num) {
    likeArray[num]++;
    texts[num].innerHTML = likeArray[num] + "like(s)";
}
