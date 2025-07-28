defmodule Todos.Seed do
  use GenServer

  def start_link(_args) do
    IO.puts("Seeding Todos...")
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    Todos.List.create_todo!("Buy groceries")
    Todos.List.create_todo!("Walk the dog")
    Todos.List.create_todo!("Read a book")
    {:ok, state}
  end
end
