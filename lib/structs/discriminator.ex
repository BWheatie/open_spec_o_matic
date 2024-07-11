defmodule Discriminator do
  @require_attrs [:propertyName]
  defstruct [:propertyName, :mapping]

  def types() do
    %{propertyName: :string, mapping: Mapping}
  end

  def changeset(%__MODULE__{} = info, params) do
    {info, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
