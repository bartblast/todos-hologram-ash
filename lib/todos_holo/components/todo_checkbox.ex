defmodule TodosHolo.Components.TodoCheckbox do
  use Hologram.Component

  prop :todo, :map
  prop :class_name, :string, default: "not-done"

  def init(params, component, _server) do
    class_name =
      if params.todo.done do
        "done"
      else
        "not-done"
      end

    component
    |> put_state(:todo, params.todo)
    |> put_state(:class_name, class_name)
  end

  def template do
    # <input type="checkbox" checked={@todo.done} /> does not work
    ~HOLO"""
    <li>
      {%if @todo.done}
        <input type="checkbox" id={@todo.id} $change="toggle_done" checked />
      {%else}
        <input type="checkbox" id={@todo.id} $change="toggle_done" />
      {/if}
      <label for={@todo.id} class={@class_name}>{@todo.title}</label>
    </li>
    """
  end

  def action(:toggle_done, %{event: %{value: value}}, component) do
    # Only prints "Checkbox toggled: on"
    IO.inspect("Checkbox toggled: #{value}")

    component
    |> put_command(:toggle_done, todo: component.state.todo)
    |> put_page(TodosHolo.HomePage)
  end

  def command(:toggle_done, params, server) do
    if params.todo.done do
      Todos.List.set_undone!(params.todo.id)
    else
      Todos.List.set_done!(params.todo.id)
    end

    server
  end
end
