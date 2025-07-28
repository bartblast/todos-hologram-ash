defmodule Todos.Todo do
  use Ash.Resource,
    domain: Todos.List,
    data_layer: Ash.DataLayer.Ets

  require Ash.Query

  actions do
    defaults [:read, :destroy]

    read :done_todos do
      filter expr(done)
    end

    create :create do
      accept :title
    end

    update :update do
      accept :title
    end

    update :done do
      change set_attribute(:done, true)
    end

    update :undone do
      change set_attribute(:done, false)
    end

    destroy :cleanup_done do
      filter expr(done)
    end
  end

  attributes do
    uuid_v7_primary_key :id
    attribute :title, :string, public?: true
    attribute :done, :boolean, default: false, public?: true
  end
end
