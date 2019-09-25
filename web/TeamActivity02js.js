function buttonClick() {
    console.log("click");
    alert("Clicked!");
}

function changeColor() {
    var newColor = document.getElementById("Change-Color-Text").value;
    console.log(newColor);
    document.getElementById("Text-One-Id").style.color = newColor;
    console.log("2");
}