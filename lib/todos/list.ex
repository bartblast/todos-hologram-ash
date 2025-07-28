defmodule Todos.List do
  use Ash.Domain, otp_app: :todos

  resources do
    resource Todos.Todo do
      define :list_todos, action: :read
      define :done_todos, action: :done_todos
      define :create_todo, args: [:title], action: :create
      define :set_title, args: [:title], action: :update
      define :set_done, action: :done
      define :set_undone, action: :undone
      define :cleanup_done, action: :cleanup_done
    end
  end
end
