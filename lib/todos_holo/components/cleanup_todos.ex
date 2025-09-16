defmodule TodosHolo.Components.CleanupTodos do
  use Hologram.Component

  def init(_props, component, _server) do
    done_count = Todos.List.done_todos!() |> Enum.count()

    component
    |> put_state(:done_count, done_count)
    |> put_state(:visible?, done_count > 0)
  end

  def template() do
    ~HOLO"""
    {%if @visible?}
      <div>
        <button $click={command: :cleanup_todos} class="button-destroy">Cleanup {@done_count} Todos</button>
      </div>
    {/if}
    """
  end

  def command(:cleanup_todos, _params, server) do
    Todos.List.done_todos!() |> Todos.List.cleanup_done!(%{})
    put_action(server, name: :reload_page, target: "page")
  end
end
