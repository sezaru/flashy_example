defmodule FlashyExampleWeb.Controller.DeadHTML do
  @moduledoc false

  use FlashyExampleWeb, :html

  embed_templates "dead_html/*"
end
