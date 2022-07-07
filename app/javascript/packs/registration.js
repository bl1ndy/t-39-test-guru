document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('#new_user')
  if (control) { control.addEventListener('input', match) }
})

const match = function() {
  let confirmation = document.querySelector('#user_password_confirmation')

  if (confirmation.value == '') { return null }

  let password = document.querySelector('#user_password')
  let checked = document.querySelector('.octicon-check-circle')
  let alert = document.querySelector('.octicon-alert')


  if (password.value == confirmation.value) {
    checked.classList.remove('hide')
    alert.classList.add('hide')
  } else {
    alert.classList.remove('hide')
    checked.classList.add('hide')
  }
}
