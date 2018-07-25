defmodule Explorer.Chain.TokenTransferTest do
  use Explorer.DataCase

  alias Explorer.Chain.TokenTransfer

  doctest Explorer.Chain.TokenTransfer

  test "returns token transfers for the given address" do
    address = insert(:address)

    TokenTransfer.fetch_token_transfers(address.hash)
  end
end
