document.addEventListener('DOMContentLoaded', () => {
    const passwordField = document.getElementById('user_password');
    const passwordConfirmationField = document.getElementById('user_password_confirmation');
    const editPasswordLink = document.getElementById('edit-password-link');

    passwordField.disabled = true;
    passwordConfirmationField.disabled = true;
    passwordConfirmationField.style.display = 'none';

    editPasswordLink.addEventListener('click', (e) => {
        e.preventDefault();
        passwordField.disabled = false;
        passwordField.focus();
        passwordConfirmationField.disabled = false;
        passwordConfirmationField.style.display = 'block';
    });

    passwordField.addEventListener('input', () => {
        passwordConfirmationField.value = passwordField.value;
    });
});
