defmodule MyBlog.PostsQueryWithKeyword do
  import Ecto.Query

  alias MyBlog.{Post, Repo, User}

  def find_all_with_user_only() do
    # DICA: inner_join == join

    # from(p in Post, inner_join: u in User, on: p.user_id == u.id)
    # |> Repo.all()

    # from(p in Post,
    #   join: u in User, on: p.user_id == u.id
    # )
    # |> Repo.all()

    from(p in Post,
      join: u in assoc(p, :user)
    )
    |> Repo.all()

    # from(u in User,
    #   join: p in assoc(u, :posts)
    # )
    # |> Repo.all()
  end

  def find_all_even_no_user() do
    from(p in Post, left_join: u in User, on: p.user_id == u.id)
    |> Repo.all()
  end

  def find_all_by_user_last_name(user_last_name) do
    from(p in Post, join: u in User, on: p.user_id == u.id, where: u.last_name == ^user_last_name)
    |> Repo.all()
  end
end
