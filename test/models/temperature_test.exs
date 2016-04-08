defmodule Tc.TemperatureTest do
  use Tc.ModelCase

  alias Tc.Temperature

  @valid_attrs %{degrees: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Temperature.changeset(%Temperature{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Temperature.changeset(%Temperature{}, @invalid_attrs)
    refute changeset.valid?
  end
end
