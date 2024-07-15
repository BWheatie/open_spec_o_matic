defmodule Info do
  @require_attrs [:title, :version]
  defstruct [:title, :summary, :description, :terms_of_service, :contact, :license, :version]

  def gen_info(module) do
    info = module.project()


    # changeset()
  end

  def types() do
    %{
      title: :string,
      summary: :string,
      description: :string,
      terms_of_service: :string,
      contact: Contact,
      license: License,
      version: :string
    }
  end

  def changeset(%__MODULE__{} = info, params) do
    {info, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
