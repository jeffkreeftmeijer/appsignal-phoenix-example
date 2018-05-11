defmodule AppsignalPhoenixExample.AccountsTest do
  use AppsignalPhoenixExample.DataCase

  alias AppsignalPhoenixExample.Accounts

  describe "users" do
    alias AppsignalPhoenixExample.Accounts.User

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias AppsignalPhoenixExample.Accounts.UserJson

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_json_fixture(attrs \\ %{}) do
      {:ok, user_json} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user_json()

      user_json
    end

    test "list_users/0 returns all users" do
      user_json = user_json_fixture()
      assert Accounts.list_users() == [user_json]
    end

    test "get_user_json!/1 returns the user_json with given id" do
      user_json = user_json_fixture()
      assert Accounts.get_user_json!(user_json.id) == user_json
    end

    test "create_user_json/1 with valid data creates a user_json" do
      assert {:ok, %UserJson{} = user_json} = Accounts.create_user_json(@valid_attrs)
      assert user_json.name == "some name"
    end

    test "create_user_json/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_json(@invalid_attrs)
    end

    test "update_user_json/2 with valid data updates the user_json" do
      user_json = user_json_fixture()
      assert {:ok, user_json} = Accounts.update_user_json(user_json, @update_attrs)
      assert %UserJson{} = user_json
      assert user_json.name == "some updated name"
    end

    test "update_user_json/2 with invalid data returns error changeset" do
      user_json = user_json_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_json(user_json, @invalid_attrs)
      assert user_json == Accounts.get_user_json!(user_json.id)
    end

    test "delete_user_json/1 deletes the user_json" do
      user_json = user_json_fixture()
      assert {:ok, %UserJson{}} = Accounts.delete_user_json(user_json)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_json!(user_json.id) end
    end

    test "change_user_json/1 returns a user_json changeset" do
      user_json = user_json_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_json(user_json)
    end
  end
end
