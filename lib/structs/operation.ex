defmodule Operation do
  defstruct [
    :tags,
    :summary,
    :description,
    :external_docs,
    :operation_id,
    :parameters,
    :request_body,
    :responses,
    :callbacks,
    :deprecated,
    :security,
    :servers
  ]

  def types() do
    %{
      tags: [:string],
      summary: :string,
      description: :string,
      external_docs: :string,
      operation_id: :string,
      parameters: [Parameter],
      request_body: RequestBody,
      responses: Responses,
      callbacks: [Callback],
      deprecated: :boolean,
      security: Security,
      servers: [Server]
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
