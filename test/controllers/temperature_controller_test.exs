defmodule Tc.TemperatureControllerTest do
  use Tc.ConnCase

  alias Tc.Temperature
  @valid_attrs %{degrees: "120.5"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, temperature_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    temperature = Repo.insert! %Temperature{}
    conn = get conn, temperature_path(conn, :show, temperature)
    assert json_response(conn, 200)["data"] == %{"id" => temperature.id,
      "degrees" => temperature.degrees}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, temperature_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, temperature_path(conn, :create), temperature: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Temperature, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, temperature_path(conn, :create), temperature: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    temperature = Repo.insert! %Temperature{}
    conn = put conn, temperature_path(conn, :update, temperature), temperature: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Temperature, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    temperature = Repo.insert! %Temperature{}
    conn = put conn, temperature_path(conn, :update, temperature), temperature: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    temperature = Repo.insert! %Temperature{}
    conn = delete conn, temperature_path(conn, :delete, temperature)
    assert response(conn, 204)
    refute Repo.get(Temperature, temperature.id)
  end
end
