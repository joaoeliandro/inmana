defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)

  end

  defp evaluate("lindo", 42) do
    "You are very special my darling!"
  end

  defp evaluate(name, age) when age >= 18 do
    "Welcome #{name}"
  end

  defp evaluate(_name, _age), do: "You shall not pass!"
end
