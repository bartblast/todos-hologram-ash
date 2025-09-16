defmodule TodosHolo.HomePage do
  use Hologram.Page

  alias TodosHolo.Components.TodoCheckbox
  alias TodosHolo.Components.AddTodo
  alias TodosHolo.Components.CleanupTodos

  route "/"

  layout TodosHolo.MainLayout

  def init(_params, component, _server) do
    todos = Todos.List.list_todos!()

    component
    |> put_state(:todos, todos)
  end

  def template do
    ~HOLO"""
    <h1>Todos</h1>

    <ul>
      {%for todo <- @todos}
        <li><TodoCheckbox cid={todo.id} todo={todo} /></li>
      {/for}
      <li><AddTodo cid="new_todo" value="x" /></li>
    </ul>

    <CleanupTodos cid="cleanup_todos" />
    """
  end
  
  def action(:reload_page, _params, component) do
    put_page(component, __MODULE__)
  end
end
