defmodule RequestBody do
  @require_attrs [:content]
  defstruct [:description, :content, :required]

  def types() do
    %{description: :string, content: MediaType, required: :boolean}
  end

  def changeset(%__MODULE__{} = info, params) do
    {info, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
