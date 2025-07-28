defmodule TodosHolo.MainLayout do
  use Hologram.Component

  alias Hologram.UI.Link
  alias Hologram.UI.Runtime

  def template do
    ~HOLO"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <title>Todos</title>
        <Runtime />
        <link rel="stylesheet" href="/assets/app.css" />
      </head>
      <body>
        <nav class="p-4">
          <Link to={TodosHolo.HomePage}>Home</Link>
        </nav>
        <main class="p-4">
          <slot />
        </main>
      </body>
    </html>
    """
  end
end
