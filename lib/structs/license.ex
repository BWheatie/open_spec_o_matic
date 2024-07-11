defmodule License do
  @required_attrs [:name]
  defstruct [:name, :identifier, :url]

  def types() do
    %{name: :string, identifier: :string, url: :string}
  end

  def changeset(%__MODULE__{} = license, params) do
    {license, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
