defmodule MyBlog.CommentsQueryWithKeyword do
  import Ecto.Query

  alias MyBlog.{Post, Repo}

  def find_all_posts_with_comments() do
    # O exemplo abaixo buscará todas as postagens do banco de dados e, em seguida,
    # fará uma consulta separada retornando todos os comentários associados às postagens fornecidas.
    # Os comentários são então processados ​​e associados a cada post retornado no campo comments.

    # from(p in Post, preload: [:comments]) |> Repo.all()

    # Muitas vezes, você pode querer que postagens e comentários sejam selecionados e filtrados na mesma consulta.
    # Para esses casos, você pode dizer explicitamente que uma junção existente seja pré-carregada no conjunto de resultados:
    Repo.all(
      from p in Post,
        distinct: true,
        join: c in assoc(p, :comments),
        preload: [comments: c]
    )
  end

  # Repo.all(
  #     from p in Post,
  #       join: c in assoc(p, :comments),
  #       where: c.inserted_at == p.updated_at,
  #       preload: [comments: c]
  #   )
end
