defmodule Book do
  # Дефиниране на структурата
  defstruct isbn: "9786192406202",
            author: "Rudyard Kipling",
            title: "The Jungle Book",
            description: "It is about the Jungle",
            price: 22.41,
            genre: "novel"

  # Функция за показване на книгата
  def print_book(%Book{} = book) do
    IO.puts("ISBN: #{book.isbn}")
    IO.puts("Author: #{book.author}")
    IO.puts("Title: #{book.title}")
    IO.puts("Description: #{book.description}")
    IO.puts("Price: $#{book.price}")
    IO.puts("Genre: #{book.genre}")
    IO.puts("==========================")
  end

  # Функция за актуализация на книга
  def update_book(book, new_data) do
    %Book{book | 
      isbn: Map.get(new_data, :isbn, book.isbn),
      author: Map.get(new_data, :author, book.author),
      title: Map.get(new_data, :title, book.title),
      description: Map.get(new_data, :description, book.description),
      price: Map.get(new_data, :price, book.price),
      genre: Map.get(new_data, :genre, book.genre)
    }
  end

  # Създаване на нов обект на структура
  def make_obj(a, b, c, d, e, f) do
    books = %Book{isbn: a, author: b, title: c, description: d, price: e, genre: f}
    IO.puts("========== Въведени стойности ==========")
    IO.inspect(books)
    update_book(books, %{})
  end
end

# Тестване
defmodule Main do
  def run do
    book = %Book{}
    
    IO.puts("=== Default Book ===")
    Book.print_book(book)

    updated_book = Book.update_book(book, %{
      title: "Mowgli",
      price: 25.99,
      description: "The adventures of Mowgli"
    })

    IO.puts("=== Updated Book ===")
    Book.print_book(updated_book)

    isbn = IO.gets("Enter ISBN: ") |> String.trim()
    author = IO.gets("Enter Author: ") |> String.trim()
    title = IO.gets("Enter Title: ") |> String.trim()
    description = IO.gets("Enter Description: ") |> String.trim()
    price = IO.gets("Enter Price: ") |> String.trim() |> String.to_float()
    genre = IO.gets("Enter Genre: ") |> String.trim()

    Book.make_obj(isbn, author, title, description, price, genre)
  end
end

Main.run()

