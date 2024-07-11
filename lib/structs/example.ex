defmodule Example do
  @require_attrs [:title, :version]
  defstruct [:summary, :description, :value, :externalValue]

  def types() do
    %{summary: :string, description: :string, value: :string, externalValue: :string}
  end

  def changeset(%__MODULE__{} = info, params) do
    {info, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
