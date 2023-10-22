defmodule FlashyExampleWeb.Components.Notifications.Custom do
  @moduledoc false

  alias Flashy.{Component, Helpers}

  use FlashyExampleWeb, :live_component

  use TypedStruct

  import PetalComponents.{Alert, Input, Button}

  typedstruct enforce: true do
    field :question, String.t()

    field :target_module, module
    field :target_id, String.t()

    field :component, Component.t()
  end

  @spec new(String.t(), module, String.t()) :: t
  def new(question, target_module, target_id) do
    struct!(__MODULE__,
      question: question,
      target_module: target_module,
      target_id: target_id,
      component: Component.new(&live_render/1)
    )
  end

  attr :key, :string, required: true
  attr :notification, __MODULE__, required: true

  attr :rest, :global

  def live_render(%{key: key} = assigns) do
    assigns = assign(assigns, id: key)

    ~H"<.live_component module={__MODULE__} {assigns} />"
  end

  def update(assigns, socket) do
    socket = socket |> assign(assigns) |> assign(form: to_form(%{}))

    {:ok, socket}
  end

  def handle_event("send_answer", %{"answer" => answer}, socket) do
    %{id: id, notification: %{target_module: module, target_id: target_id}} = socket.assigns

    send_update(module, id: target_id, answer: answer)

    socket = push_event(socket, "js-exec", %{to: "##{id}", attr: "data-hide"})

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div
      id={@id}
      class={Helpers.notification_classes()}
      phx-mounted={Helpers.show_notification(@key)}
      data-hide={Helpers.hide_notification(@key)}
      data-show={Helpers.show_notification(@key)}
      {@rest}
    >
      <.alert with_icon color="info" class="relative overflow-hidden">
        <.form for={@form} phx-submit="send_answer" phx-target={@myself}>
          <div class="flex flex-col gap-2">
            <div><%= Phoenix.HTML.raw(@notification.question) %></div>

            <.input field={@form[:answer]} />

            <.button type="submit" label="Answer" />
          </div>
        </.form>
      </.alert>
    </div>
    """
  end
end

defimpl Flashy.Protocol, for: FlashyExampleWeb.Components.Notifications.Custom do
  def module(notification), do: notification.component.module

  def function_name(notification), do: notification.component.function_name
end
