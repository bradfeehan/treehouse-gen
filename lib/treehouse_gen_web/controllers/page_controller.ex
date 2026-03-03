defmodule TreehouseGenWeb.PageController do
  use TreehouseGenWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
