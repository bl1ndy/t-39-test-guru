document.addEventListener('turbolinks:load', function() {
  let controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for (let i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }

    let errors = document.querySelector('.object-errors')

    if (errors) {
      let objectId = errors.dataset.objectId
      formInlineHandler(objectId)
    }
  }
})

const formInlineLinkHandler = function(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  formInlineHandler(testId)
}

const formInlineHandler = function(testId) {
  let editLink = document.querySelector('#edit-link[data-test-id="' + testId + '"]')
  let cancelLink = document.querySelector('#cancel-link[data-test-id="' + testId + '"]')
  let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    editLink.classList.add('hide')
    cancelLink.classList.remove('hide')
  } else {
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
    cancelLink.classList.add('hide')
    editLink.classList.remove('hide')
  }
}
