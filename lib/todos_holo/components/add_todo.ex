defmodule TodosHolo.Components.AddTodo do
  use Hologram.Component

  def init(_props, component, _server) do
    put_state(component, :title, "")
  end
  
  def template do
    ~HOLO"""
    <form $submit={command: :add_todo}>
      <input type="text" placeholder="Add a new todo" name="title" value={@title} />
      <button type="submit" class="button">Add</button>
    </form>
    """
  end

  def command(:add_todo, %{event: %{"title" => title}}, server) do
    Todos.List.create_todo!(title)    
    put_action(server, name: :reload_page, target: "page")
  end
end
