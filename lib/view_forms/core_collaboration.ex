defmodule ViewForms.CoreCollaboration do
  import HTTPoison
  import Jason

  def validate_publishing(token) do
    # _response = get! "http://httparrot.herokuapp.com/get"
    # :invalid
    :valid
  end

  def publish_draft(draft) do
    IO.puts(encode! draft)
  end
end
  