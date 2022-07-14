document.addEventListener('turbolinks:load', function() {
  let timer = document.querySelector('#countdown')
  if (timer) {
    timer.addEventListener('load', countdown)
    const interval = setInterval(countdown, 1000)
  }
})

const countdown = function() {
  const endTime = document.querySelector('#countdown').dataset.endtime
  const difference = +new Date(endTime) - +new Date()
  let remaining = ''

  if (difference > 0) {
    const parts = [
      Math.floor((difference / (1000 * 60 * 60)) % 24),
      Math.floor((difference / 1000 / 60) % 60),
      Math.floor((difference / 1000) % 60),
    ]
    remaining = parts.map((part) => String(part).padStart(2, '0')).join(":")
  } else {
    window.location.replace("/");
  }

  document.getElementById("countdown").innerHTML = remaining
}
