# Todos

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Ash

- Domain List: [lib/todos/list.ex](lib/todos/list.ex)
- Resource Todo: [lib/todos/todo.ex](lib/todos/todo.ex)
- Seed: [lib/todos/seed.ex](lib/todos/seed.ex)

## Hologram

- HomePage: [lib/todos_holo/home_page.ex](lib/todos_holo/home_page.ex)
- AddTodo: [lib/todos_holo/components/add_todo.ex](lib/todos_holo/components/add_todo.ex)
- TodoCheckbox: [lib/todos_holo/components/cleanup_todos.ex](lib/todos_holo/components/cleanup_todos.ex)
- CleanupTodos: [lib/todos_holo/components/todo_checkbox.ex](lib/todos_holo/components/todo_checkbox.ex)

### Questions

- How do I clear the input value after the `:add_todo` event?
- Is there a way to make the `<input checked={boolean}>` work?
- The event of `<input type="checkbox">` always has `value: "on"`?
- Event type [`input`](https://developer.mozilla.org/en-US/docs/Web/API/Element/input_event) seems missing at the moment?

## Learn more

  * Elixir: https://elixir-lang.org/docs.html
  * Phoenix: https://hexdocs.pm/phoenix/overview.html
  * Ash: https://hexdocs.pm/ash/readme.html
  * Hologram: https://hologram.page/
