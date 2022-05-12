defmodule MyBlog.CommentsQueryWithPipe do
  import Ecto.Query

  alias MyBlog.{Post, Repo, Comment}

  def find_all_posts_with_comments() do
    # O exemplo abaixo buscará todas as postagens do banco de dados e, em seguida,
    # fará uma consulta separada retornando todos os comentários associados às postagens fornecidas.
    # Os comentários são então processados ​​e associados a cada post retornado no campo comments.

    # Post
    # |> preload([:comments])
    # |> Repo.all

    # Muitas vezes, você pode querer que postagens e comentários sejam selecionados e filtrados na mesma consulta.
    # Para esses casos, você pode dizer explicitamente que uma junção existente seja pré-carregada no conjunto de resultados:
    comments_query =
      Comment
      |> select([c], c.body)

    Post
    |> distinct(true)
    |> join(:inner, [p], c in assoc(p, :comments))
    |> preload(comments: ^comments_query)
    |> Repo.all()

    # Post
    # |> join(:inner, [p], c in Comment, on: p.id == c.post_id)
    # |> preload([:comments])
    # |> Repo.all()
  end
end
