defmodule Contact do
  defstruct [:name, :url, :email]

  def types() do
    %{name: :string, url: :string, email: :string}
  end

  def changeset(%__MODULE__{} = contact, params) do
    {contact, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
