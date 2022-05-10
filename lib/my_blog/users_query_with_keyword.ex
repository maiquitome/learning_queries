defmodule MyBlog.UsersQueryWithKeyword do
  import Ecto.Query

  alias MyBlog.Repo

  # DICA:
  # * Podemos usar "users" ou MyBlog.User.
  # * Com MyBlog.User sem o select retorna os schemas.
  def find_all_by_first_name(first_name) do
    # query =
    #   from u in "users",
    #     where: u.first_name == ^first_name,
    #     select: u.last_name

    query =
      from u in MyBlog.User,
        where: u.first_name == ^first_name

    Repo.all(query)
  end

  def find_all_by_letter(letter) do
    like = "%" <> letter <> "%"

    from(u in MyBlog.User,
      where: like(u.first_name, ^like),
      or_where: like(u.last_name, ^like),
      select: [u.first_name, u.last_name]
    )
    |> Repo.all()
  end
end
