defmodule Schema do
  defstruct [:title, :description, :type, :format, :required, :properties, :additionalProperties, :discriminator]

  def types() do
    %{title: :string, description: :string, type: :string, format: :string, required: :string, properties: :string, additionalProperties: %{}, discriminator: Discriminator}
  end

  def changeset(%__MODULE__{} = info, params) do
    {info, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
