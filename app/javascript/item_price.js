const { inputChangeSelector } = require("@rails/ujs");

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const tax = Math.floor(inputValue * 0.1);
    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = Math.floor(inputValue - tax);
  })
});