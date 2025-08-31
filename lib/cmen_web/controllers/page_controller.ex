defmodule CmenWeb.PageController do
  use CmenWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
