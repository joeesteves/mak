defmodule Mak.Bpm do
  def post_case(order) do
    Application.get_env(:teamplace, :credentials)
    |> Teamplace.post_data("maqrepint", adapt_order(order))
  end

  def adapt_order(order) do
    %{
      Prioridad: 0,
      Descripcion: build_description(order.desc, order.user, order.machine.name, order.machine_id),
      Titulo: order.title,
      FechaComprobante: order.date,
      Fecha: order.date,
      PersonaIDPropietario: "413",
      TransaccionTipoID: "CASOTEAMPLACE",
      TransaccionSubtipoID: "CB - MAQ",
      MaquinaCodigo: order.machine_id
    }
    |> Poison.encode!()
  end

  defp build_description(description, user, machine_name, machine_codigo) do
    "Codigo: " <> machine_codigo <> " -- Maquina: " <> machine_name <> " -- Solicita: " <> user.username <> " -- \n " <> description
  end
end
