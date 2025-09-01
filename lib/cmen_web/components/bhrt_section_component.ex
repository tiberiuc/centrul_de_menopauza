defmodule CmenWeb.BhrtSectionComponent do
  use CmenWeb, :html

  attr :class, :string, default: nil

  def bhrt_section(assigns) do
    ~H"""
    <section id="bhrt" class={["py-20 bg-white", @class]}>
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            {gettext("Terapia de Substituție Hormonală Bioidentică (BHRT)")}
          </h2>
          <p class="text-xl text-gray-600 max-w-4xl mx-auto">
            {gettext(
              "Tratament personalizat cu hormoni naturali identici cu cei produși de organism pentru o menopauză echilibrată și sănătoasă"
            )}
          </p>
        </div>

        <.bhrt_introduction />
        <.hormones_used />
        <.treatment_process />
        <.administration_forms />
        <.safety_information />
        <.bhrt_cta />
      </div>
    </section>
    """
  end

  defp bhrt_introduction(assigns) do
    ~H"""
    <div class="mb-20">
      <div class="bg-gradient-to-br from-green-50 to-blue-50 rounded-2xl p-8 lg:p-12">
        <h3 class="text-2xl font-bold text-gray-900 mb-6">
          {gettext("Ce este Terapia Hormonală Bioidentică?")}
        </h3>
        <p class="text-lg text-gray-600 leading-relaxed mb-8">
          {gettext(
            "BHRT folosește hormoni derivați din plante, identici la nivel molecular cu hormonii produși natural de corpul feminin. Spre deosebire de hormonii sintetici, hormonii bioidentici au aceeași structură chimică ca estrogenul, progesteronul și testosteronul naturali."
          )}
        </p>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <.benefit_card
            emoji="🌿"
            bg_color="bg-green-500"
            title={gettext("Natural și Sigur")}
            description={gettext("Hormoni derivați din plante, identici cu cei naturali")}
          />
          <.benefit_card
            emoji="🎯"
            bg_color="bg-blue-500"
            title={gettext("Personalizat")}
            description={gettext("Dozaj adaptat nevoilor individuale")}
          />
          <.benefit_card
            emoji="⚖️"
            bg_color="bg-purple-500"
            title={gettext("Echilibrat")}
            description={gettext("Restabilește echilibrul hormonal natural")}
          />
          <.benefit_card
            emoji="💊"
            bg_color="bg-pink-500"
            title={gettext("Flexibil")}
            description={gettext("Multiple forme de administrare")}
          />
        </div>
      </div>
    </div>
    """
  end

  defp hormones_used(assigns) do
    ~H"""
    <div class="mb-20">
      <h3 class="text-2xl font-bold text-gray-900 text-center mb-12">
        {gettext("Hormonii Utilizați în BHRT")}
      </h3>
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <.hormone_card
          emoji="🌸"
          title={gettext("Estrogen Bioidentic")}
          bg_color="bg-pink-50"
          border_color="border-pink-100"
          title_color="text-pink-800"
          types={gettext("Estradiol (E2), Estriol (E3), Estron (E1)")}
          benefits={[
            gettext("Reducerea bufeurilor de căldură"),
            gettext("Îmbunătățirea uscăciunii vaginale"),
            gettext("Protecția densității osoase"),
            gettext("Menținerea funcției cognitive"),
            gettext("Îmbunătățirea calității somnului")
          ]}
          forms={gettext("Gel, plasturi, tablete, ovule vaginale")}
          forms_bg="bg-pink-100"
          forms_text_color="text-pink-700"
          forms_title_color="text-pink-800"
        />

        <.hormone_card
          emoji="🌙"
          title={gettext("Progesteron Bioidentic")}
          bg_color="bg-purple-50"
          border_color="border-purple-100"
          title_color="text-purple-800"
          types={gettext("Echilibrează efectele estrogenului și protejează endometrul")}
          benefits={[
            gettext("Îmbunătățirea calității somnului"),
            gettext("Reducerea anxietății"),
            gettext("Protecția împotriva cancerului endometrial"),
            gettext("Stabilizarea dispoziției"),
            gettext("Reducerea retenției de apă")
          ]}
          forms={gettext("Capsule orale, gel, ovule vaginale")}
          forms_bg="bg-purple-100"
          forms_text_color="text-purple-700"
          forms_title_color="text-purple-800"
        />

        <.hormone_card
          emoji="💪"
          title={gettext("Testosteron Bioidentic")}
          bg_color="bg-orange-50"
          border_color="border-orange-100"
          title_color="text-orange-800"
          types={gettext("Doze mici pentru echilibrul hormonal")}
          benefits={[
            gettext("Creșterea libidoului"),
            gettext("Îmbunătățirea energiei"),
            gettext("Menținerea masei musculare"),
            gettext("Îmbunătățirea dispoziției"),
            gettext("Creșterea densității osoase")
          ]}
          forms={gettext("Gel, creme, pellete subcutanate")}
          forms_bg="bg-orange-100"
          forms_text_color="text-orange-700"
          forms_title_color="text-orange-800"
        />
      </div>
    </div>
    """
  end

  defp treatment_process(assigns) do
    ~H"""
    <div class="mb-20">
      <h3 class="text-2xl font-bold text-gray-900 text-center mb-12">
        {gettext("Procesul de Tratament BHRT")}
      </h3>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
        <.process_step
          step="1"
          title={gettext("Evaluare Inițială Comprehensivă")}
          bg_color="from-blue-500 to-blue-600"
          items={[
            gettext("Anamneza medicală detaliată"),
            gettext("Evaluarea simptomelor curente"),
            gettext("Examen fizic complet"),
            gettext("Analiza istoricului familial")
          ]}
        />

        <.process_step
          step="2"
          title={gettext("Analize Hormonale Complete")}
          bg_color="from-green-500 to-green-600"
          items={[
            gettext("Estradiol, Progesterone, Testosterone"),
            gettext("FSH, LH pentru confirmarea menopauzei"),
            gettext("Hormoni tiroidieni (TSH, T3, T4)"),
            gettext("Cortizol, DHEA-S, Insulin")
          ]}
        />

        <.process_step
          step="3"
          title={gettext("Personalizarea Tratamentului")}
          bg_color="from-purple-500 to-purple-600"
          items={[
            gettext("Interpretarea rezultatelor analizelor"),
            gettext("Stabilirea dozajelor personalizate"),
            gettext("Alegerea formei de administrare"),
            gettext("Planul de monitorizare")
          ]}
        />

        <.process_step
          step="4"
          title={gettext("Monitorizare și Ajustări")}
          bg_color="from-pink-500 to-pink-600"
          items={[
            gettext("Control la 6-8 săptămâni"),
            gettext("Analize de monitorizare la 3 luni"),
            gettext("Ajustări dozaj după necesități"),
            gettext("Controale regulate la 6 luni")
          ]}
        />
      </div>
    </div>
    """
  end

  defp administration_forms(assigns) do
    ~H"""
    <div class="mb-20">
      <h3 class="text-2xl font-bold text-gray-900 text-center mb-12">
        {gettext("Forme de Administrare BHRT")}
      </h3>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <.administration_card
          emoji="💊"
          title={gettext("Capsule Orale")}
          advantages={gettext("Convenabile, dozaj precis")}
          disadvantages={gettext("Metabolism hepatic")}
          ideal_for={gettext("Progesterone")}
        />

        <.administration_card
          emoji="🧴"
          title={gettext("Geluri și Creme")}
          advantages={gettext("Absorbție directă, evită ficatul")}
          disadvantages={gettext("Aplicare zilnică")}
          ideal_for={gettext("Estrogen, Testosterone")}
        />

        <.administration_card
          emoji="🏥"
          title={gettext("Plasturi Transdermice")}
          advantages={gettext("Eliberare constantă, convenabile")}
          disadvantages={gettext("Posibile iritații locale")}
          ideal_for={gettext("Estrogen")}
        />
      </div>
    </div>
    """
  end

  defp safety_information(assigns) do
    ~H"""
    <div class="mb-20">
      <h3 class="text-2xl font-bold text-gray-900 text-center mb-12">
        {gettext("Siguranța și Contraindicațiile BHRT")}
      </h3>
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <.safety_card
          emoji="✅"
          title={gettext("Candidați Ideali pentru BHRT")}
          bg_color="bg-green-50"
          border_color="border-green-200"
          title_color="text-green-800"
          items={[
            gettext("Femei în peri/menopauză cu simptome"),
            gettext("Dorința pentru tratament natural"),
            gettext("Lipsa contraindicațiilor majore"),
            gettext("Angajament pentru monitorizare regulată")
          ]}
          item_color="text-green-700"
          bullet_color="text-green-500"
        />

        <.safety_card
          emoji="⚠️"
          title={gettext("Contraindicații și Precauții")}
          bg_color="bg-red-50"
          border_color="border-red-200"
          title_color="text-red-800"
          items={[
            gettext("Istoric de cancer hormono-dependent"),
            gettext("Boli hepatice severe active"),
            gettext("Tromboembolism verios netratat"),
            gettext("Sângerări vaginale neexplicate"),
            gettext("Sarcină și alăptarea")
          ]}
          item_color="text-red-700"
          bullet_color="text-red-500"
        />

        <.safety_card
          emoji="🔍"
          title={gettext("Monitorizare Necesară")}
          bg_color="bg-blue-50"
          border_color="border-blue-200"
          title_color="text-blue-800"
          items={[
            gettext("Analize hormonale regulate"),
            gettext("Controale ginecologice anuale"),
            gettext("Mamografie anuală"),
            gettext("Monitorizarea tensiunii arteriale"),
            gettext("Teste funcții hepatice")
          ]}
          item_color="text-blue-700"
          bullet_color="text-blue-500"
        />
      </div>
    </div>
    """
  end

  defp bhrt_cta(assigns) do
    ~H"""
    <div class="bg-gradient-to-br from-pink-600 to-purple-600 rounded-2xl p-8 lg:p-12 text-center text-white">
      <h3 class="text-2xl font-bold mb-4">
        {gettext("Ești pregătită pentru BHRT?")}
      </h3>
      <p class="text-lg mb-8 max-w-3xl mx-auto opacity-90">
        {gettext(
          "Descoperă dacă terapia hormonală bioidentică este potrivită pentru tine. Programează o consultație pentru evaluare comprehensivă și plan de tratament personalizat."
        )}
      </p>
      <button
        phx-click="scroll_to_section"
        phx-value-section="contact"
        class="bg-white text-pink-600 hover:bg-gray-50 px-8 py-3 rounded-lg text-lg font-semibold transition-colors shadow-lg hover:shadow-xl"
      >
        {gettext("Consultație BHRT")}
      </button>
    </div>
    """
  end

  attr :emoji, :string, required: true
  attr :bg_color, :string, required: true
  attr :title, :string, required: true
  attr :description, :string, required: true

  defp benefit_card(assigns) do
    ~H"""
    <div class="bg-white rounded-xl p-6 shadow-sm">
      <div class={"w-12 h-12 #{@bg_color} rounded-lg flex items-center justify-center mb-4"}>
        <span class="text-2xl">{@emoji}</span>
      </div>
      <h4 class="font-semibold text-gray-900 mb-2">{@title}</h4>
      <p class="text-sm text-gray-600">{@description}</p>
    </div>
    """
  end

  attr :emoji, :string, required: true
  attr :title, :string, required: true
  attr :bg_color, :string, required: true
  attr :border_color, :string, required: true
  attr :title_color, :string, required: true
  attr :types, :string, required: true
  attr :benefits, :list, required: true
  attr :forms, :string, required: true
  attr :forms_bg, :string, required: true
  attr :forms_text_color, :string, required: true
  attr :forms_title_color, :string, required: true

  defp hormone_card(assigns) do
    ~H"""
    <div class={"#{@bg_color} rounded-xl p-8 border #{@border_color}"}>
      <div class="flex items-center mb-6">
        <span class="text-3xl mr-3">{@emoji}</span>
        <h4 class={"text-xl font-bold #{@title_color}"}>{@title}</h4>
      </div>
      <div class="mb-4">
        <p class={"text-sm #{@title_color} font-semibold mb-2"}>
          <%= cond do %>
            <% String.contains?(@title, "Estrogen") -> %>
              {gettext("Tipuri:")}
            <% String.contains?(@title, "Progesteron") -> %>
              {gettext("Rolul:")}
            <% true -> %>
              {gettext("Pentru femei:")}
          <% end %>
        </p>
        <p class="text-sm text-gray-600 mb-4">{@types}</p>
      </div>
      <div class="mb-4">
        <p class={"text-sm #{@title_color} font-semibold mb-2"}>{gettext("Beneficii:")}</p>
        <ul class="text-sm text-gray-600 space-y-1">
          <%= for benefit <- @benefits do %>
            <li>• {benefit}</li>
          <% end %>
        </ul>
      </div>
      <div class={"#{@forms_bg} rounded-lg p-3"}>
        <p class={"text-sm #{@forms_title_color} font-semibold mb-1"}>
          {gettext("Forme disponibile:")}
        </p>
        <p class={"text-sm #{@forms_text_color}"}>{@forms}</p>
      </div>
    </div>
    """
  end

  attr :step, :string, required: true
  attr :title, :string, required: true
  attr :bg_color, :string, required: true
  attr :items, :list, required: true

  defp process_step(assigns) do
    ~H"""
    <div class="relative h-full">
      <div class={"bg-gradient-to-br #{@bg_color} text-white rounded-xl p-6 h-full flex flex-col"}>
        <div class="text-center mb-4">
          <div class="w-12 h-12 bg-white bg-opacity-20 rounded-full flex items-center justify-center mx-auto mb-4">
            <span class="text-xl font-bold">{@step}</span>
          </div>
          <h4 class="font-semibold mb-3">{@title}</h4>
        </div>
        <ul class="text-sm space-y-2 flex-grow">
          <%= for item <- @items do %>
            <li>• {item}</li>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end

  attr :emoji, :string, required: true
  attr :title, :string, required: true
  attr :advantages, :string, required: true
  attr :disadvantages, :string, required: true
  attr :ideal_for, :string, required: true

  defp administration_card(assigns) do
    ~H"""
    <div class="bg-white border border-gray-200 rounded-xl p-6 hover:shadow-lg transition-shadow">
      <div class="text-center mb-4">
        <span class="text-4xl mb-3 block">{@emoji}</span>
        <h4 class="font-semibold text-gray-900">{@title}</h4>
      </div>
      <div class="space-y-2 text-sm text-gray-600">
        <p><strong class="text-green-600">{gettext("Avantaje:")}</strong> {@advantages}</p>
        <p><strong class="text-orange-600">{gettext("Dezavantaje:")}</strong> {@disadvantages}</p>
        <p><strong class="text-blue-600">{gettext("Ideal pentru:")}</strong> {@ideal_for}</p>
      </div>
    </div>
    """
  end

  attr :emoji, :string, required: true
  attr :title, :string, required: true
  attr :bg_color, :string, required: true
  attr :border_color, :string, required: true
  attr :title_color, :string, required: true
  attr :items, :list, required: true
  attr :item_color, :string, required: true
  attr :bullet_color, :string, required: true

  defp safety_card(assigns) do
    ~H"""
    <div class={"#{@bg_color} rounded-xl p-8 border #{@border_color}"}>
      <div class="flex items-center mb-6">
        <span class="text-3xl mr-3">{@emoji}</span>
        <h4 class={"text-xl font-bold #{@title_color}"}>{@title}</h4>
      </div>
      <ul class={"space-y-3 #{@item_color}"}>
        <%= for item <- @items do %>
          <li class="flex items-start">
            <span class={"#{@bullet_color} mr-2 mt-1"}>•</span>
            <span>{item}</span>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end
end
