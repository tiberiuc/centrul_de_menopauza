defmodule Cmen.Email do
  import Swoosh.Email

  def contact_form_email(params) do
    new()
    |> to("tibi@happysoft.ro")
    |> from({"Centrul de Menopauza", "noreply@centrul-menopauza.ro"})
    |> subject("Mesaj de pe site Centrul de Menopauza")
    |> html_body(contact_form_html(params))
    |> text_body(contact_form_text(params))
  end

  defp contact_form_html(params) do
    """
    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
      <h2 style="color: #ec4899;">Mesaj nou de pe site-ul Centrul de Menopauza</h2>
      
      <div style="background-color: #fdf2f8; padding: 20px; border-radius: 8px; margin: 20px 0;">
        <h3 style="color: #831843; margin-top: 0;">Detalii contact:</h3>
        
        <p><strong>Nume:</strong> #{params["name"]}</p>
        <p><strong>Email:</strong> #{params["email"]}</p>
        #{if params["phone"] && params["phone"] != "", do: "<p><strong>Telefon:</strong> #{params["phone"]}</p>", else: ""}
        
        <h3 style="color: #831843;">Mesaj:</h3>
        <div style="background-color: white; padding: 15px; border-radius: 4px; border-left: 4px solid #ec4899;">
          #{String.replace(params["message"] || "", "\n", "<br>")}
        </div>
      </div>
      
      <p style="color: #6b7280; font-size: 12px; margin-top: 30px;">
        Acest email a fost trimis automat de pe site-ul Centrul de Menopauza.
      </p>
    </div>
    """
  end

  defp contact_form_text(params) do
    phone_text =
      if params["phone"] && params["phone"] != "", do: "Telefon: #{params["phone"]}\n", else: ""

    """
    Mesaj nou de pe site-ul Centrul de Menopauza

    Detalii contact:
    Nume: #{params["name"]}
    Email: #{params["email"]}
    #{phone_text}
    Mesaj:
    #{params["message"]}

    ---
    Acest email a fost trimis automat de pe site-ul Centrul de Menopauza.
    """
  end
end
