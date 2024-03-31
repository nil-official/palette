function validateEmail(inputId, iconId) {
    const emailInput = document.getElementById(inputId);
    const iconElement = document.getElementById(iconId);

    const emailRegex = /^(?!.*\.{2})[a-zA-Z0-9][a-zA-Z0-9.-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    const email = emailInput.value.trim();
    if (emailRegex.test(email)) {
        emailInput.classList.remove('invalid-email');
        emailInput.classList.add('valid-email');
        iconElement.classList.remove('fa-times');
        iconElement.classList.add('fa-check');
        iconElement.style.color = 'green'; // Change icon color to green
    } else {
        emailInput.classList.remove('valid-email');
        emailInput.classList.add('invalid-email');
        iconElement.classList.remove('fa-check');
        iconElement.classList.add('fa-times');
        iconElement.style.color = 'red'; // Change icon color to red
    }
    iconElement.style.display = 'inline-block'; // Make icon visible
}