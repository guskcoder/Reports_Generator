defmodule ReportsGenerator do
  alias ReportsGenerator.Parser
  def build(filename) do
    filename
    |> Parser.parser_file()
    |> Enum.reduce(reporte_acc(), fn line, report -> sum_values(line, reports) end)
  end

  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
