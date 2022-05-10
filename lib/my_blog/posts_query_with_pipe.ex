defmodule MyBlog.PostsQueryWithPipe do
  import Ecto.Query

  alias MyBlog.{Post, Repo, User}

  def find_all_with_user_only() do
    Post
    |> join(:inner, [p], u in User, on: p.user_id == u.id)
    |> Repo.all()
  end

  def find_all_even_no_user() do
    Post
    |> join(:left, [p], u in User, on: p.user_id == u.id)
    |> Repo.all()
  end

  def find_all_by_user_last_name(user_last_name) do
    Post
    |> join(:inner, [p], u in User, on: p.user_id == u.id)
    |> where([p, u], u.last_name == ^user_last_name)
    |> Repo.all()
  end
end
