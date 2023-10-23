defmodule FlashyExampleWeb.Components.Notifications.Disconnected do
  @moduledoc false

  alias FlashyExampleWeb.Components.Notifications.Helpers

  use FlashyExampleWeb, :html

  use Flashy.Disconnected

  import PetalComponents.Alert

  attr :key, :string, required: true

  def render(assigns) do
    ~H"""
    <Flashy.Disconnected.render
      key={@key}
      class="!pr-3 pl-3 !translate-x-full translate-x-[-100%]"
      hide_action={Helpers.hide_notification(@key)}
      show_action={Helpers.show_notification(@key)}
    >
      <.alert with_icon color="danger" heading="We can't find the internet">
        Attempting to reconnect <Heroicons.arrow_path class="ml-1 w-3 h-3 inline animate-spin" />
      </.alert>
    </Flashy.Disconnected.render>
    """
  end
end
