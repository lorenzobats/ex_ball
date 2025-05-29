defmodule ExBallWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("ball_exit", %{"direction" => dir, "x" => x, "y" => y, "ax" => ax, "ay" => ay}, socket) do
    broadcast!(socket, "ball_exit", %{direction: dir, x: x, y: y, ax: ax, ay: ay})
    {:noreply, socket}
  end
end
