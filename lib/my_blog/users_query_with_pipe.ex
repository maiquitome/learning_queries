defmodule MyBlog.UsersQueryWithPipe do
  import Ecto.Query

  alias MyBlog.Repo

  def find_all_by_first_name(first_name) do
    # "users"
    # |> where([u], u.first_name == ^first_name)
    # |> select([u], u.last_name)
    # |> Repo.all()

    MyBlog.User
    |> where([u], u.first_name == ^first_name)
    |> Repo.all()
  end

  def find_all_by_letter(letter) do
    like = "%" <> letter <> "%"

    MyBlog.User
    |> where([u], like(u.first_name, ^like))
    |> or_where([u], like(u.last_name, ^like))
    |> select([u], %{first_name: u.first_name, last_name: u.last_name})
    |> Repo.all()
  end
end
