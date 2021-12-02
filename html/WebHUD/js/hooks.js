function setHealth(ammount) {
    $("#health>.text>.number").html(ammount);
}
function setArmor(ammount) {
    $("#armor").css("display","")
    if (ammount!=0)
    $("#armor>.text>.number").html(ammount);
    else $("#armor").css("display","none");
}
function setAmmo(ammount) {
    $("#ammo").css("display","")
    if (ammount!=-1)
    $("#ammo>.text>span>.number").html(ammount);
    else $("#ammo").css("display","none");
}
function setReserve(ammount) {
    $("#ammo>.text>span>.numbersmall").css("display","")
    if (ammount!=0)
    $("#ammo>.text>span>.numbersmall").html(ammount);
    else $("#ammo>.text>span>.numbersmall").css("display","none");
}
function setAlt(ammount) {
    $("#alt").css("display","")
    if (ammount!=0)
    $("#alt>.text>.number").html(ammount);
    else $("#alt").css("display","none");
}