defmodule ViewForms.CoreCollaboration do
  import HTTPoison
  import Jason

  def validate_publish_token do
    # _response = get! "http://httparrot.herokuapp.com/get"
    # IO.puts(encode! response)
    # :invalid
    :valid
  end

  def send_draft(draft) do
    IO.puts(encode! draft)
  end
end
  