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
  let editIcon = document.querySelector('.octicon-pencil')
  let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    editIcon.classList.replace('octicon-pencil', 'octicon-x-circle')
    link.innerHTML = 'Cancel'
  } else {
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
    editIcon.classList.replace('octicon-x-circle', 'octicon-pencil')
    link.innerHTML = editIcon.outerHTML
  }
}
