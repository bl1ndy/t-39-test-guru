document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  let tbody = document.querySelector('tbody')
  let rows = tbody.querySelectorAll('tr')
  let sortedRows = []

  for (let i = 0; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  sortedRows.sort(compareRowsAsc)

  let sortedTableBody = document.createElement('tbody')

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTableBody.appendChild(sortedRows[i])
  }

  tbody.parentNode.replaceChild(sortedTableBody, tbody)
}

function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
