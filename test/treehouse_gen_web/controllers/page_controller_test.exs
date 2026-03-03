defmodule TreehouseGenWeb.PageControllerTest do
  use TreehouseGenWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "GET /", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/")
    assert html =~ "Hello, world!"
  end
end
