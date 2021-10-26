defmodule Mak.Recurring do
  use Task

  def start_link(_opts) do
    Task.start_link(__MODULE__, :run, [])
  end

  def run() do
    receive do
    after
      2_000_000 ->
        do_work()
        run()
    end
  end

  defp do_work() do
    IO.puts("My recurring work!")
  end
end

# TODO: cada x horas revisar si hay pendientes e intentar enviar
