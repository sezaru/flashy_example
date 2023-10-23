defmodule FlashyExampleWeb.Components.Notifications.Helpers do
  @moduledoc false

  alias Phoenix.LiveView.JS

  def hide_notification(key) do
    JS.hide(
      to: "##{key}",
      transition: {"ease-in duration-300", "translate-x-0", "translate-x-[-100%]"},
      time: 300
    )
    |> JS.push("lv:clear-flash", value: %{key: key})
  end

  def show_notification(key) do
    JS.show(
      to: "##{key}",
      transition: {"ease-in duration-300", "translate-x-[-100%]", "translate-x-0"},
      time: 300
    )
  end
end
