function setError(element) {
  element.classList.add("input-error");
}
function clearError(element) {
  element.classList.remove("input-error");
}
function verif1() {
  const select = document.getElementById("select");
  const categorieIndex = select.selectedIndex;
  const descInput = document.getElementById("desc");
  const desc = descInput.value.trim();
  const r1 = document.getElementById("r1").checked;
  const r2 = document.getElementById("r2").checked;
  const r3 = document.getElementById("r3").checked;
  const r4 = document.getElementById("r4").checked;
  const prixInput = document.getElementById("prix");
  const prixValue = prixInput.value;
  const prix = Number(prixValue);
  clearError(select);
  clearError(descInput);
  clearError(prixInput);
  if (categorieIndex === 0) {
    setError(select);
    alert("Please choose a category.");
    return false;
  }
  const isCorrectLength = desc.length >= 10 && desc.length <= 100;
  const firstChar = desc.charAt(0);
  const lastChar = desc.charAt(desc.length - 1);
  const lettersRegex = /^[A-Za-z]$/;
  if (
    !isCorrectLength ||
    !lettersRegex.test(firstChar) ||
    !lettersRegex.test(lastChar)
  ) {
    setError(descInput);
    alert(
      "Description must be between 10 and 100 characters and start and end with a letter."
    );
    return false;
  }
  if (!r1 && !r2 && !r3 && !r4) {
    alert("Selecting a size is mandatory.");
    return false;
  }
  if (isNaN(prix) || prix < 100 || prix > 2000) {
    setError(prixInput);
    alert("Price must be a number between 100 and 2000.");
    return false;
  }
  return true;
}
function verif2() {
  const habitInput = document.getElementById("habit");
  const cinInput = document.getElementById("cin");
  const dureeInput = document.getElementById("duree");
  const habit = Number(habitInput.value);
  const cin = cinInput.value.trim();
  const duree = Number(dureeInput.value);
  clearError(habitInput);
  clearError(cinInput);
  clearError(dureeInput);
  if (!Number.isInteger(habit) || habit < 1) {
    setError(habitInput);
    alert("Outfit code must be an integer greater than or equal to 1.");
    return false;
  }
  const cinRegex = /^[01][0-9]{7}$/;
  if (!cinRegex.test(cin)) {
    setError(cinInput);
    alert(
      "Customer CIN must be 8 digits and start with 0 or 1."
    );
    return false;
  }
  if (isNaN(duree) || !Number.isInteger(duree) || duree < 1 || duree > 4) {
    setError(dureeInput);
    alert("Rental duration must be a number between 1 and 4 days.");
    return false;
  }
  return true;
}
