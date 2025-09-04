defmodule CmenWeb.ContactSectionComponent do
  use CmenWeb, :html

  attr :class, :string, default: nil
  attr :form_data, :map, default: %{}

  def contact_section(assigns) do
    ~H"""
    <section id="contact" class={["py-20 bg-white", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            {gettext("Get in Touch")}
          </h2>
          <p class="text-xl text-gray-600 max-w-3xl mx-auto">
            {gettext(
              "Ready to take the next step in your wellness journey? Contact us today to schedule your consultation."
            )}
          </p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
          <.contact_information />
          <.contact_form form_data={@form_data} />
        </div>
      </div>
    </section>
    """
  end

  defp contact_information(assigns) do
    ~H"""
    <div class="space-y-8">
      <.contact_item
        icon="hero-phone"
        title={gettext("Phone")}
        content="+40 (774) 008 195"
      />

      <.contact_item
        icon="hero-envelope"
        title={gettext("Email")}
        content="contact@aestheticlab.ro"
      />

      <.contact_item
        icon="hero-map-pin"
        title={gettext("Address")}
        content="Brasov | str. Carpatilor nr.93, bl.2"
      />
    </div>
    """
  end

  attr :form_data, :map, default: %{}

  defp contact_form(assigns) do
    ~H"""
    <div class="bg-gradient-to-br from-pink-50 to-purple-50 rounded-xl p-8">
      <form id="contact-form" class="space-y-6" phx-submit="send_contact_email" phx-hook="ResetForm">
        <.form_field
          type="text"
          id="name"
          name="name"
          label={gettext("Name")}
          placeholder={gettext("Your name")}
          required="true"
          value={@form_data["name"] || ""}
        />

        <.form_field
          type="email"
          id="email"
          name="email"
          label={gettext("Email")}
          placeholder={gettext("Your email")}
          required="true"
          value={@form_data["email"] || ""}
        />

        <.form_field
          type="tel"
          id="phone"
          name="phone"
          label={gettext("Phone")}
          placeholder={gettext("Your phone number")}
          value={@form_data["phone"] || ""}
        />

        <div>
          <label for="message" class="block text-sm font-medium text-gray-700 mb-2">
            {gettext("Message")}
          </label>
          <textarea
            id="message"
            name="message"
            rows="4"
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent text-black"
            placeholder={gettext("How can we help you?")}
            required
          ><%= @form_data["message"] || "" %></textarea>
        </div>

        <button
          type="submit"
          class="w-full bg-pink-600 hover:bg-pink-700 text-white px-8 py-3 rounded-lg text-lg font-semibold transition-colors shadow-lg hover:shadow-xl disabled:opacity-50"
        >
          {gettext("Schedule Appointment")}
        </button>
      </form>
    </div>
    """
  end

  attr :icon, :string, required: true
  attr :title, :string, required: true
  attr :content, :string, required: true

  defp contact_item(assigns) do
    ~H"""
    <div class="flex items-start">
      <div class="w-12 h-12 bg-pink-600 rounded-lg flex items-center justify-center mr-4">
        <.icon name={@icon} class="h-6 w-6 text-white" />
      </div>
      <div>
        <h3 class="text-lg font-semibold text-gray-900 mb-2">
          {@title}
        </h3>
        <p class="text-gray-600">{@content}</p>
      </div>
    </div>
    """
  end

  attr :type, :string, required: true
  attr :id, :string, required: true
  attr :name, :string, required: true
  attr :label, :string, required: true
  attr :placeholder, :string, required: true
  attr :required, :string, default: "false"
  attr :value, :string, default: ""

  defp form_field(assigns) do
    ~H"""
    <div>
      <label for={@id} class="block text-sm font-medium text-gray-700 mb-2">
        {@label}
      </label>
      <input
        type={@type}
        id={@id}
        name={@name}
        value={@value}
        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent text-black"
        placeholder={@placeholder}
        required={@required == "true"}
      />
    </div>
    """
  end
end
