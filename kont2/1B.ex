defmodule Magazine.Article do
  defstruct id: "", name: "", end_price: 0.0, quantity: 0, restock_price: 0.0

  def new(id, name, end_price, quantity, restock_price) do
    if valid_id?(id) do
      %__MODULE__{
        id: id,
        name: name,
        end_price: end_price,
        quantity: quantity,
        restock_price: restock_price
      }
    else
      {:error, "Invalid ID format. Only letters and numbers allowed."}
    end
  end

  defp valid_id?(id), do: Regex.match?(~r/^[A-Za-z0-9]+$/, id)
end

defmodule Magazine do
  alias Magazine.Article

  def add_article(list, id, name, end_price, quantity, restock_price) do
  case Article.new(id, name, end_price, quantity, restock_price) do
    %Article{} = new_article ->
      case Enum.find(list, fn %Article{id: existing_id} -> existing_id == id end) do
        nil ->
          [new_article | list]

        %Article{} = existing ->
          updated = %Article{existing | quantity: existing.quantity + quantity}
          updated_list = Enum.map(list, fn
            %Article{id: ^id} -> updated
            other -> other
          end)
          
          updated_list
      end

    {:error, msg} ->
      IO.puts(msg)
      list
  end
end

  def show_all(articles) do
    Enum.each(articles, fn article ->
      IO.inspect(article)
    end)
  end

  def delete_article(list, id) do
    Enum.reject(list, fn %Article{id: a_id} -> a_id == id end)
  end

  def show_sorted_by_id(articles) do
    articles
    |> Enum.sort_by(& &1.id)
    |> show_all()
  end

  def total_sold_value(articles) do
    articles
    |> Enum.map(fn %Article{quantity: q, end_price: p} -> q * p end)
    |> Enum.sum()
  end

    def save_to_file(articles, filename \\ "articlePrint.txt") do
      existing_ids =
        case File.read(filename) do
          {:ok, content} ->
            content
            |> String.split("\n", trim: true)
            |> Enum.map(fn line ->
              [id | _] = String.split(line, ",")
              id
            end)

          {:error, _} -> []
        end

      new_articles = Enum.reject(articles, fn article -> article.id in existing_ids end)

      Enum.each(new_articles, fn article ->
        line = "#{article.id},#{article.name},#{article.end_price},#{article.quantity},#{article.restock_price}\n"
        File.write!(filename, line, [:append])
      end)

      IO.puts("Saved #{length(new_articles)} new articles to #{filename}")
    end

  def show_file_contents(filename \\ "articlePrint.txt") do
    case File.read(filename) do
      {:ok, content} -> IO.puts(content)
      {:error, _} -> IO.puts("File not found or unreadable.")
    end
  end
end
defmodule Main do
  def run do
    IO.puts("== Starting Magazine Inventory Test ==")

    articles = []

    articles = Magazine.add_article(articles, "AA101", "Notebook", 3.50, 10, 1.50)
    articles = Magazine.add_article(articles, "BB202", "Pen", 1.20, 25, 0.60)
    articles = Magazine.add_article(articles, "CC303", "Eraser", 0.75, 50, 0.25)
    articles = Magazine.add_article(articles, "CC303", "Eraser", 0.75, 50, 0.25)

    IO.puts("\n== Show All Articles ==")
    Magazine.show_all(articles)

    IO.puts("\n== Sorted Articles by ID ==")
    Magazine.show_sorted_by_id(articles)

    IO.puts("\n== Deleting Article with ID 'BB202' ==")
    articles = Magazine.delete_article(articles, "BB202")

    IO.puts("\n== Articles After Deletion ==")
    Magazine.show_all(articles)

    IO.puts("\n== Total Sold Value ==")
    IO.puts("€#{Magazine.total_sold_value(articles)}")

    IO.puts("\n== Saving Articles to articlePrint.txt ==")
    Magazine.save_to_file(articles)

    IO.puts("\n== Contents of articlePrint.txt ==")
    Magazine.show_file_contents()
  end
end

Main.run()

