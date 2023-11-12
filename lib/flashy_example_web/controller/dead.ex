defmodule FlashyExampleWeb.Controller.Dead do
  @moduledoc false

  alias FlashyExampleWeb.Components.Notifications

  use FlashyExampleWeb, :controller

  def index(conn, _) do
    message = "Blibs <i>blobs</i>"

    notification = Notifications.Normal.new(:info, message)

    conn |> put_notification(notification) |> render(:index)
  end
end
