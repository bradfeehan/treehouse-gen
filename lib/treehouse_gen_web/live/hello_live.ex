defmodule TreehouseGenWeb.HelloLive do
  use TreehouseGenWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-2xl py-16 text-center">
      <h1 class="text-4xl font-bold">Hello, world!</h1>
    </div>
    """
  end
end
