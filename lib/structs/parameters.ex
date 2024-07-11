defmodule Parameters do
  defstruct [
    :name,
    :in,
    :description,
    :required,
    :allowEmptyValue,
    :style,
    :explode,
    :allowReserved,
    :schema,
    :deprecated,
    :example,
    :examples,
    :content
  ]

  def types() do
    %{
      name: [:string],
      in: ["query", "header", "path", "cookie"],
      description: :string,
      required: :boolean,
      allowEmptyValue: :boolean,
      style: ["matrix", "label", "form", "simple", "spaceDelimited", "pipeDelimted", "deepObject"],
      explode: :boolean,
      allowReserved: :boolean,
      schema: Schema,
      deprecated: :boolean,
      example: %{},
      examples: [Example],
      content: Content
    }
  end

  def generated_operation(args) do
  end

  def changeset(%__MODULE__{} = info, params) do
    {info, types()}
    |> Ecto.Changeset.cast(params, Map.keys(types()))
    |> Ecto.Changset.validate_required(@required_attrs)
  end
end
