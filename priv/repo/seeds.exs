alias MyBlog.{User, Post, Repo, Comment}

##########################
###### USERS
##########################
maiqui_tome =
  %User{}
  |> User.changeset(%{first_name: "Maiqui", last_name: "Tomé"})
  |> Repo.insert!()

mike_mago =
  %User{}
  |> User.changeset(%{first_name: "Mike", last_name: "Mago"})
  |> Repo.insert!()

_mike_shinoda =
  %User{}
  |> User.changeset(%{first_name: "Mike", last_name: "Shinoda"})
  |> Repo.insert!()

_mike_candys =
  %User{}
  |> User.changeset(%{first_name: "Mike", last_name: "Candys"})
  |> Repo.insert!()

_mike_tyson =
  %User{}
  |> User.changeset(%{first_name: "Mike", last_name: "Tyson"})
  |> Repo.insert!()

##########################
###### POSTS
##########################
maiqui_tome_first_post =
  %Post{}
  |> Post.changeset(%{
    title: "Primeiro Post do Maiqui Tomé",
    body: "Olá, esse é o primeiro post do Maiqui Tomé...",
    user_id: maiqui_tome.id
  })
  |> Repo.insert!()

maiqui_tome_second_post =
  %Post{}
  |> Post.changeset(%{
    title: "Segundo Post do Maiqui Tomé",
    body: "Olá, esse é o segundo post do Maiqui Tomé...",
    user_id: maiqui_tome.id
  })
  |> Repo.insert!()

mike_mago_single_post =
  %Post{}
  |> Post.changeset(%{
    title: "Único Post do Mike Mago",
    body: "Olá, esse é o único post do Mike Mago...",
    user_id: mike_mago.id
  })
  |> Repo.insert!()

##########################
###### COMMENTS
##########################
_maiqui_tome_first_post_first_comment =
  %Comment{}
  |> Comment.changeset(%{
    body: "Esse é o primeiro cometário do primeiro post do Maiqui Tomé.",
    post_id: maiqui_tome_first_post.id
  })
  |> Repo.insert!()

_maiqui_tome_first_post_second_comment =
  %Comment{}
  |> Comment.changeset(%{
    body: "Esse é o segundo cometário do primeiro post do Maiqui Tomé.",
    post_id: maiqui_tome_first_post.id
  })
  |> Repo.insert!()

_maiqui_tome_second_post_first_comment =
  %Comment{}
  |> Comment.changeset(%{
    body: "Esse é o primeiro cometário do segundo post do Maiqui Tomé.",
    post_id: maiqui_tome_second_post.id
  })
  |> Repo.insert!()

_mike_mago_post_single_comment =
  %Comment{}
  |> Comment.changeset(%{
    body: "Esse é o único cometário do único post do Mike Mago.",
    post_id: mike_mago_single_post.id
  })
  |> Repo.insert!()
