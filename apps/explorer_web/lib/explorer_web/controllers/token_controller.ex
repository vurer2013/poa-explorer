defmodule ExplorerWeb.TokenController do
  use ExplorerWeb, :controller

  alias Explorer.Chain
  alias Explorer.Chain.{Token, TokenTransfer}
  alias Explorer.PagingOptions

  @page_size 50
  @default_paging_options %PagingOptions{page_size: @page_size + 1}

  def show(conn, %{"id" => address_hash_string} = params) do
    with {:ok, address_hash} <- Chain.string_to_address_hash(address_hash_string) do
      token = Token.token_from_address(address_hash)

      transfers = TokenTransfer.fetch_token_transfers(address_hash, paging_options(params))

      render(
        conn,
        "show.html",
        transfers: transfers,
        token: token
      )
    else
      :error ->
        not_found(conn)

      {:error, :not_found} ->
        not_found(conn)
    end
  end

  defp paging_options(%{"index" => last_id}), do: %{@default_paging_options | key: last_id}
  defp paging_options(_params), do: @default_paging_options
end
