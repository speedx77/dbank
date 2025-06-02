import { dbank_backend as dbank }  from "../../declarations/dbank_backend" 

window.addEventListener("load", async function () {
    const currentAmount = await dbank.checkBalance();
    this.document.getElementById("value").innerHTML =  currentAmount.toFixed(2)
    console.log(currentAmount)
})

document.querySelector("form").addEventListener("submit", async function(event) {
    event.preventDefault();
    console.log("submitted");

    const button = event.target.querySelector("#submit-btn")

    const deposit = parseFloat(document.getElementById("input-amount").value);
    const withdrawal = parseFloat(document.getElementById("withdrawal-amount").value);

    deposit && await dbank.topUp(deposit)
    withdrawal && await dbank.withdraw(withdrawal)
    console.log(deposit)
    console.log(withdrawal)

    button.setAttribute("disabled", true);
    //await dbank.withdraw(withdrawal)
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerHTML =  currentAmount.toFixed(2);

    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = ""
    button.removeAttribute("disabled");
    
})