defmodule Server do
  @required_attrs [:url]
  defstruct [:description, :variables, :url]

  def types() do
    %{description: :string, variables: {:string, ServerVariable}, url: :string}
  end

  def changeset(%__MODULE__{} = server, params) do
    {server, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
