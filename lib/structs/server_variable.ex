defmodule ServerVariable do
  @required_attrs [:default]
  defstruct [:enum, :default, :description]

  def types() do
    %{enum: [:string], default: :string, description: :string}
  end

  def changeset(%__MODULE__{} = server_variable, params) do
    {server_variable, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
