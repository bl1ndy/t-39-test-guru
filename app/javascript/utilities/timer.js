document.addEventListener('turbolinks:load', function() {
  let timer = document.getElementById('countdown')

  if (timer) {
    timer.addEventListener('load', countdown)
    setInterval(countdown, 1000)
  }
})

const update = function() {
  const updateButton = document.getElementById('next-question')

  updateButton.click()
}

const countdown = function() {
  const timer = document.getElementById('countdown')
  const endTime = timer.dataset.endtime
  const difference = +new Date(endTime) - +new Date()
  let remaining = 'Time is up!'

  if (difference > 0) {
    const parts = [
      Math.floor((difference / (1000 * 60 * 60)) % 24),
      Math.floor((difference / 1000 / 60) % 60),
      Math.floor((difference / 1000) % 60),
    ]
    remaining = parts.map((part) => String(part).padStart(2, '0')).join(":")
  } else {
    timer.classList.add('border-danger')
    setTimeout(update, 2000)
  }

  timer.innerHTML = remaining
}
