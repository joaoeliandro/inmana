defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a especial message" do
      params = %{"name" => "banana", "age" => "42"}

      result = Welcomer.welcome(params)

      expect_result = {:ok, "You are very special"}

      assert result == expect_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "Joao", "age" => "22"}

      result = Welcomer.welcome(params)

      expect_result = {:ok, "Welcome Joao"}

      assert result == expect_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "Joao", "age" => "17"}

      result = Welcomer.welcome(params)

      expect_result = {:error, "You shall not pass Joao"}

      assert result == expect_result
    end
  end
end
