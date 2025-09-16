defmodule TodosHolo.Components.TodoCheckbox do
  use Hologram.Component
  
  prop :todo, :map

  def init(props, component, _server) do
    put_state(component, :todo, props.todo)
  end

  def template do
    ~HOLO"""
    <li>
      <input type="checkbox" id={@todo.id} $change="toggle_done" checked={@todo.done} />
      <label for={@todo.id} class={class(@todo.done)}>{@todo.title}</label>
    </li>
    """
  end

  def action(:toggle_done, %{event: %{value: value}}, component) do
    component
    |> put_state([:todo, :done], value)
    |> put_command(:save_todo, todo: component.state.todo)
  end

  def command(:save_todo, params, server) do
    if params.todo.done do
      Todos.List.set_done!(params.todo.id)
    else
      Todos.List.set_undone!(params.todo.id)
    end

    server
  end
  
  defp class(true), do: "done"
  
  defp class(false), do: nil
end
