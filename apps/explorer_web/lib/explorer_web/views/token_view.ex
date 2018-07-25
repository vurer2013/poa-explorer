defmodule ExplorerWeb.TokenView do
  use ExplorerWeb, :view

  alias Explorer.Chain.Hash

  def hash_string(%Hash{} = hash) do
    to_string(hash)
  end
end
