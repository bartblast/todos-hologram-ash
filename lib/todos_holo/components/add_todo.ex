defmodule TodosHolo.Components.AddTodo do
  use Hologram.Component

  prop :title, :string, default: ""

  def template do
    ~HOLO"""
    <form $submit="add_todo">
      <input type="text" placeholder="Add a new todo" name="title" value={@title} />
      <button type="submit" class="button">Add</button>
    </form>
    """
  end

  def action(:add_todo, %{event: %{"title" => title}}, component) do
    component
    |> put_state(:title, "")    
    |> put_command(:save_todo, title: title)
  end

  def command(:save_todo, params, server) do
    Todos.List.create_todo!(params.title)    
    put_action(server, name: :reload_page, target: "page")
  end
end
