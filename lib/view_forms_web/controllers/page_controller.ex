defmodule ViewFormsWeb.PageController do
  import ViewForms.CoreCollaboration
  use ViewFormsWeb, :controller
  plug Plug.CSRFProtection

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def add_venue_form(conn, params) do
    csrf = get_csrf_token()
    token = params["token"]

    render conn, "add_venue.html",
      csrf: csrf,
      token: token
  end

  def add_venue_handler(conn, params) do
    token = params["token"]

    template = case validate_publishing token do
      :valid -> 
        publish_draft params["draft"]
        "thanks.html"
      :invalid ->
        "error.html"
    end
    
    render conn, template
  end
end
