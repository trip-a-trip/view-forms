defmodule ViewFormsWeb.PageController do
  import ViewForms.CoreCollaboration
  use ViewFormsWeb, :controller
  plug Plug.CSRFProtection

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def add_venue_form(conn, _params) do
    csrf = get_csrf_token()

    render conn, "add_venue.html", csrf: csrf
  end

  def add_venue_handler(conn, params) do
    template = case validate_publish_token() do
      :valid ->
        send_draft params["draft"]
        "thanks.html"
      :invalid ->
        "error.html"
    end
    
    render conn, template
  end
end
