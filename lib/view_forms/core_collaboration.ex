defmodule ViewForms.CoreCollaboration do
  import HTTPoison
  import Jason

  def validate_publishing(token) do
    case get collaboration_url("/v1/publication/token/validate/" <> token) do
      {:ok, %HTTPoison.Response{status_code: 200, body: "true"}} -> :valid
      _ -> :invalid
    end
  end

  def publish_draft(token, params) do
    kind_params = [
      [params["for_breakfast"], "breakfast"],
      [params["for_lunch"], "lunch"],
      [params["for_dinner"], "dinner"],
      [params["for_bite_drink"], "bite-drink"]
    ]

    link_param = [
      ["Instagram", params["link_instagram"]],
      ["Сайт", params["link_site"]]
    ]

    draft = encode! %{
      :token => token,
      :name => params["name"],
      :description => params["description"],
      :isExpensive => trasnform_bool(params["is_expensive"]),
      :isAmazing => trasnform_bool(params["is_amazing"]),
      :kind => Enum.reduce(kind_params, [], &(item_param_reducer(&1, &2))),
      :links => Enum.reduce(link_param, [], &(map_param_reducer([first: "title", second: "url"], &1, &2))),
      :address => params["coordinates_address"],
      :coordinates => %{
        :longitude => params["coordinates_longitude"],
        :latitude => params["coordinates_latitude"]
      }
    }

    post! collaboration_url("/v1/publication/draft/create"), draft, [{"Content-Type", "application/json"}]
  end

  defp collaboration_url postfix do
    baseUrl = System.get_env("COLLABORATION_URL") ||
      raise """
      environment variable COLLABORATION_URL is missing.
      Please, provide it.
      """

    baseUrl <> postfix
  end

  defp item_param_reducer(curr, acc) do
    case curr do
      [nil, _] -> acc
      [_, item] -> [item | acc]
    end
  end

  defp map_param_reducer(keys, curr, acc) do
    case curr do
      [nil, _] -> acc
      [_, ""] -> acc
      [first, second] ->
        elem = %{}
          |> Map.put(keys[:first], first)
          |> Map.put(keys[:second], second)
        [ elem | acc]
    end
  end

  defp trasnform_bool(value) do
    case value do
      "on" -> true
      _ -> false
    end
  end
end
  