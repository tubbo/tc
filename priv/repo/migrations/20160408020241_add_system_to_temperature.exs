defmodule Tc.Repo.Migrations.AddSystemToTemperature do
  use Ecto.Migration

  def change do
    alter table(:temperature) do
      add :system, :string
    end
  end
end
