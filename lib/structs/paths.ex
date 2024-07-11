defmodule Paths do
  @doc """
  Routes output:
  path helper, method, path, controller, action

  function output:
  {path, [path_helper, method, controller, action]}
  """
  def get_paths(router) do
    results =
      "mix phx.routes #{router}"
      |> System.shell()
      |> elem(0)
      |> String.split("==> open_spec_o_matic\n==> app\n ")
      |> List.last()
      |> String.split()
      |> Enum.chunk_every(5)
      |> Enum.map(fn e ->
        List.pop_at(e, 2)
      end)

    Enum.map(results, fn {path, stuff} ->
      %{path => path_item(stuff)}
    end)
  end

  def path_item([_helper, method, controller, _action]) do
    method = String.downcase(method)
    %{method => Operation.generate_operation()}
  end
end
