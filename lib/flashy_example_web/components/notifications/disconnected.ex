defmodule FlashyExampleWeb.Components.Notifications.Disconnected do
  @moduledoc false

  use FlashyExampleWeb, :html

  use Flashy.Disconnected

  import PetalComponents.Alert
  import PetalComponents.Icon

  attr :key, :string, required: true

  def render(assigns) do
    ~H"""
    <Flashy.Disconnected.render key={@key}>
      <.alert with_icon color="danger" heading="We can't find the internet">
        Attempting to reconnect <.icon name="hero-arrow-path" class="ml-1 w-3 h-3 inline animate-spin" />
      </.alert>
    </Flashy.Disconnected.render>
    """
  end
end
