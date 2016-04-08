defmodule Tc.Repo.Migrations.CreateTemperature do
  use Ecto.Migration

  def change do
    create table(:temperature) do
      add :degrees, :float

      timestamps
    end

  end
end
