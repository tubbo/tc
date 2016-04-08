defmodule Tc.Repo do
  use Ecto.Repo, otp_app: :tc, adapter: Sqlite.Ecto
end
