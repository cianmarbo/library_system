const userCardTemplate = document.querySelector("[data-user-template]")
const userCardContainer = document.querySelector("[data-user-cards-container]")
const searchInput = document.querySelector("[data-search]")

let books = []

searchInput.addEventListener("input", e => {
    const value = e.target.value.toLowerCase()
    books.forEach(book => {
        const isVisible = 
        book.title.toLowerCase().includes(value) || 
        book.author.toLowerCase().includes(value)
    book.element.classList.toggle("hide", !isVisible)
    })
})

fetch("http://127.0.0.1:3000/books")
  .then(res => res.json())
  .then(data => {
    books = data.map(book => {
      const card = userCardTemplate.content.cloneNode(true).children[0]
      const header = card.querySelector("[data-header]")
      const body = card.querySelector("[data-body]")
      const textStatus = card.querySelector("[data-status]")
      header.textContent = book.title
      body.textContent = book.author
      textStatus.textContent = checkStatus(book.status)
      userCardContainer.append(card)
      return { title: book.title, author: book.author, status: book.status, element: card }
    })
  })

  function checkStatus(status) {
    return status == 1 ? "Checked In" : "Checked Out"
  }
