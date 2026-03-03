defmodule TreehouseGenWeb.HelloLiveTest do
  use TreehouseGenWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "renders hello world", %{conn: conn} do
    {:ok, _view, html} = live(conn, ~p"/")
    assert html =~ "Hello, world!"
  end
end
