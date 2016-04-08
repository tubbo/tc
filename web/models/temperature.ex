defmodule Tc.Temperature do
  use Tc.Web, :model

  schema "temperature" do
    field :degrees, :float
    field :system, :string

    timestamps
  end

  @required_fields ~w(degrees)
  @optional_fields ~w(system)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
