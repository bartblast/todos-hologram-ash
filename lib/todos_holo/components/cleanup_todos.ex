defmodule TodosHolo.Components.CleanupTodos do
  use Hologram.Component

  prop :done_count, :integer, default: 0

  def init(_params, component, _server) do
    done_count = Todos.List.done_todos!() |> Enum.count()

    component
    |> put_state(:done_count, done_count)
    |> put_state(:visible?, done_count > 0)
  end

  def template() do
    ~HOLO"""
    {%if @visible?}
      <div>
        <button $click="cleanup_todos" class="button-destroy">Cleanup {@done_count} Todos</button>
      </div>
    {/if}
    """
  end

  def action(:cleanup_todos, _params, component) do
    component
    |> put_command(:cleanup_todos)
    |> put_page(TodosHolo.HomePage)
  end

  def command(:cleanup_todos, _params, server) do
    Todos.List.done_todos!() |> Todos.List.cleanup_done!(%{})

    server
  end
end
