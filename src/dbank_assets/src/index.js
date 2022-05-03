import {dbank} from "../../declarations/dbank";

window.addEventListener("load", async function(){
// console.log("Finished loading");

// Balance 
update();
});

document.querySelector("form").addEventListener("submit",async function(event){
  event.preventDefault();
// console.log("Submitted")

const button = event.target.querySelector("#submit-btn");

const inputAmount = parseFloat(document.getElementById("input-amount").value);
const withdrawlAmount = parseFloat(document.getElementById("withdrawal-amount").value);

button.setAttribute("disabled", true);


if (document.getElementById("input-amount").value.length != 0) {
await dbank.topUp(inputAmount);

}

button.setAttribute("disabled", true);
if (document.getElementById("withdrawal-amount").value.length != 0) {
await dbank.withdrawl(withdrawlAmount);

}

// Compound Interest 
await dbank.compound()


update()
//Clear the input and withdrawal amounts
document.getElementById("input-amount").value = "";
document.getElementById("withdrawal-amount").value = "";
button.removeAttribute("disabled");

});

async function update(){
  const currentAmount = await (await dbank.checkBalance());
document.getElementById("value").innerText = Math.round(currentAmount * 100 )/ 100;
};