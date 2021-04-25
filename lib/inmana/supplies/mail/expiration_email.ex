defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email
  use Bamboo.Phoenix, view: InmanaWeb.EmailView

  alias Inmana.Supply

  def create(to_email, _supplies) do
    base_email()
    |> to(to_email)
    |> subject("Supplies that are about to expire")
    |> assign(:supply, %{
      description: "Carne moída",
      expiration_date: "2021-04-19",
      responsible: "Zé do pão"
    })
    |> render("inmana.html")

    # IO.inspect(supply_reducer(supplies))
  end

  defp base_email do
    new_email()
    |> from("go@inmana.com")
    |> put_html_layout({InmanaWeb.LayoutView, "email.html"})
  end

  defp supply_reducer(supplies) do
    Enum.reduce(
      supplies,
      fn supply ->
        supply
      end
    )
  end

  defp supply_struct(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    supply = %{
      description: description,
      expiration_date: expiration_date,
      responsible: responsible
    }

    supply
  end
end
