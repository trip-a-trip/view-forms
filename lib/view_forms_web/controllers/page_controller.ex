defmodule ViewFormsWeb.PageController do
  use ViewFormsWeb, :controller
  plug Plug.CSRFProtection

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def add_venue_form(conn, _params) do
    csrf = get_csrf_token()

    render conn, "add_venue.html", csrf: csrf
  end

  def add_venue_handler(conn, _params) do
    # IO.puts(_params)
    # TODO: handle request =)

    render conn, "thanks.html"
  end
end
