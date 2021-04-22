defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "go@inmana.com",
      subject: "Supplies that are about to expire",
      text_body: email_text(supplies)
    )
  end

  defp email_text(supplies) do
    initial_text = "---------- Supplies that are about to expire: ----------\n"

    Enum.reduce(
      supplies,
      initial_text,
      fn supply, text ->
        text <> supply_string(supply)
      end
    )
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description},\nExpiration Date: #{expiration_date},\nResponsible: #{
      responsible
    }\n"
  end
end
