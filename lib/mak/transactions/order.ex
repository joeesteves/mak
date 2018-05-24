defmodule Mak.Transactions.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field(:date, :date)
    field(:desc, :string)
    field(:title, :string)

    belongs_to(:type, Mak.Transactions.Type)
    belongs_to(:machine, Mak.Base.Machine)
    belongs_to(:user, Mak.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:date, :title, :desc, :type_id, :machine_id, :user_id])
    |> validate_required([:date, :title, :desc])
  end
end
