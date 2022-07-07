document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

const sortRowsByTitle = function() {
  let tbody = document.querySelector('tbody')
  let rows = tbody.querySelectorAll('tr')
  let sortedRows = []

  for (let i = 0; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  let arrowUp = this.querySelector('.octicon-arrow-up')
  let arrowDown = this.querySelector('.octicon-arrow-down')

  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    arrowUp.classList.remove('hide')
    arrowDown.classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowUp.classList.add('hide')
    arrowDown.classList.remove('hide')
  }

  let sortedTableBody = document.createElement('tbody')

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTableBody.appendChild(sortedRows[i])
  }

  tbody.parentNode.replaceChild(sortedTableBody, tbody)
}

const compareRowsAsc = (row1, row2) => {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

const compareRowsDesc = (row1, row2) => {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
