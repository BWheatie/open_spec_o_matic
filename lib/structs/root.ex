defmodule Root do
  def generate_root() do
    %{
      "openapi" => "3.1.0",
      "info" => Info,
      "jsonSchemaDialect" => "",
      "servers" => [Server],
      "paths" => Paths,
      "webhooks" => [],
      "components" => Component,
      "security" => [],
      "tags" => [],
      "externalDocs" => ExternalDocs
    }
  end
end
