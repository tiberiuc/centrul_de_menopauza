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
          Ce este Terapia Hormonală Bioidentică?
        </h3>
        <div class="mb-8">
          <p class="text-lg text-gray-700 leading-relaxed mb-4">
            BHRT utilizează hormoni derivați din plante (soia, ignam sălbatic), care au structură moleculară identică cu cea a hormonilor produși natural de corpul feminin.
          </p>
          <p class="text-lg text-gray-700 leading-relaxed">
            Spre deosebire de hormonii sintetici, hormonii bioidentici sunt mai bine recunoscuți de organism, asigurând o toleranță crescută și un profil de siguranță mai bun.
          </p>
        </div>

        <div class="mb-8">
          <h4 class="text-xl font-semibold text-gray-900 mb-6 flex items-center">
            <span class="mr-3">✅</span>
            Beneficiile BHRT
          </h4>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          <.detailed_benefit_card
            emoji="🌿"
            bg_color="bg-green-500"
            title="Natural și sigur"
            description="Hormonii bioidentici provin din surse vegetale și sunt metabolizați de corp ca propriii hormoni."
          />
          <.detailed_benefit_card
            emoji="🎯"
            bg_color="bg-blue-500"
            title="Personalizat"
            description="Dozajul este ajustat în funcție de analize, simptome și nevoile fiecărei paciente."
          />
          <.detailed_benefit_card
            emoji="⚖️"
            bg_color="bg-purple-500"
            title="Echilibrat"
            description="Ajută la reducerea bufeurilor, insomniei, schimbărilor de dispoziție și la prevenirea complicațiilor (osteoporoză, boli cardiovasculare)."
          />
          <.detailed_benefit_card
            emoji="💊"
            bg_color="bg-pink-500"
            title="Flexibil"
            description="Disponibil sub formă de capsule, geluri, creme, plasturi sau ovule – în funcție de preferințe și recomandarea medicului."
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

      <div class="bg-gradient-to-br from-blue-50 to-indigo-50 rounded-2xl p-8 mb-12">
        <p class="text-lg text-gray-700 leading-relaxed text-center max-w-4xl mx-auto mb-6">
          În BHRT (Bioidentical Hormone Replacement Therapy / Terapia de substituție hormonală cu hormoni bioidentici) sunt folosiți hormoni care au structură moleculară identică cu cea a hormonilor produși natural de organismul uman. Ei pot fi administrați sub formă de creme, geluri, capsule, supozitoare sau plasturi, în funcție de nevoile pacientei și de recomandarea medicului.
        </p>
        <h4 class="text-xl font-semibold text-gray-900 text-center mb-8">
          Principalii hormoni utilizați în BHRT:
        </h4>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-12">
        <.detailed_hormone_card
          emoji="🔹"
          title="Estrogenii bioidentici"
          bg_color="bg-pink-50"
          border_color="border-pink-200"
          title_color="text-pink-800"
          types={[
            {"Estradiol (E2)",
             "principalul estrogen activ la femeile aflate în premenopauză și menopauză"},
            {"Estriol (E3)",
             "considerat mai blând, utilizat mai ales pentru sănătatea vaginală și prevenirea uscăciunii/atrofiei"}
          ]}
          role="reduc bufeurile, transpirațiile nocturne, insomniile, previn osteoporoza, mențin sănătatea cardiovasculară și a pielii"
          forms={gettext("Gel, plasturi, ovule vaginale")}
          forms_bg="bg-pink-100"
          forms_text_color="text-pink-700"
          forms_title_color="text-pink-800"
        />

        <.detailed_hormone_card
          emoji="🔹"
          title="Progesteron bioidentic (micronizat)"
          bg_color="bg-purple-50"
          border_color="border-purple-200"
          title_color="text-purple-800"
          types={[
            {"Se administrează frecvent în combinație cu estrogen",
             "pentru a proteja endometrul (mucoasa uterină) împotriva hiperplaziei și riscului de cancer"},
            {"Are efect calmant", "îmbunătățește somnul și echilibrul emoțional"}
          ]}
          role="Important: forma bioidentică micronizată, nu derivatul sintetic (progestativele clasice)"
          forms={gettext("Capsule orale")}
          forms_bg="bg-purple-100"
          forms_text_color="text-purple-700"
          forms_title_color="text-purple-800"
        />
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <.detailed_hormone_card
          emoji="🔹"
          title="Testosteron bioidentic"
          bg_color="bg-orange-50"
          border_color="border-orange-200"
          title_color="text-orange-800"
          types={[
            {"Da, și femeile au nevoie de testosteron", "dar în doze mult mai mici decât bărbații"},
            {"Poate fi folosit pentru",
             "scăderea oboselii, creșterea libidoului, îmbunătățirea masei musculare și a densității osoase"}
          ]}
          role="Se administrează doar cu monitorizare atentă, pentru a evita efectele secundare (exces de păr, acnee, îngroșarea vocii)"
          forms={gettext("Gel, creme")}
          forms_bg="bg-orange-100"
          forms_text_color="text-orange-700"
          forms_title_color="text-orange-800"
        />

        <.detailed_hormone_card
          emoji="🔹"
          title="DHEA (dehidroepiandrosteron)"
          bg_color="bg-green-50"
          border_color="border-green-200"
          title_color="text-green-800"
          types={[
            {"Un precursor hormonal produs de glandele suprarenale",
             "care poate fi transformat în estrogen și testosteron în organism"},
            {"Util pentru", "energie, vitalitate, memorie și funcție sexuală"}
          ]}
          role=""
          forms="Ovule"
          forms_bg="bg-green-100"
          forms_text_color="text-green-700"
          forms_title_color="text-green-800"
        />

        <.detailed_hormone_card
          emoji="🔹"
          title="Melatonina"
          bg_color="bg-indigo-50"
          border_color="border-indigo-200"
          title_color="text-indigo-800"
          types={[
            {"Nu este un hormon sexual",
             "dar uneori e inclusă în BHRT pentru reglarea somnului și a ritmului circadian"}
          ]}
          role=""
          forms="Capsule, tablete cu eliberare prelungită"
          forms_bg="bg-indigo-100"
          forms_text_color="text-indigo-700"
          forms_title_color="text-indigo-800"
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
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <.detailed_process_step
          step="1"
          title="Consultația inițială"
          bg_color="from-blue-500 to-blue-600"
          items={[
            "Discuție detaliată cu medicul specialist",
            "Se evaluează: istoricul medical, simptomele, stilul de viață, istoricul familial (boli cardiovasculare, cancer, osteoporoză etc.)",
            "Se discută așteptările pacientei și beneficiile vs. riscurile BHRT",
            "Analize de sânge pentru hormoni (estradiol, progesteron, testosteron, testosteron liber, FSH, LH, DHEA-S, cortizol, tiroidieni etc)",
            "Analize generale (profil lipidic, glicemie, funcție hepatică, funcție renală etc.)",
            "Ecografie transvaginală și mamară / mamografie (în funcție de vârstă și recomandări)",
            "Alte investigații personalizate (DEXA pentru densitate osoasă, evaluare cardiologică)"
          ]}
        />

        <.detailed_process_step
          step="2"
          title="Stabilirea planului personalizat de tratament"
          bg_color="from-purple-500 to-purple-600"
          items={[
            "Pe baza rezultatelor și simptomelor, medicul elaborează o schemă de tratament",
            "Alegerea hormonilor necesari (estrogen, progesteron, testosteron, DHEA etc.)",
            "Stabilirea formei de administrare: geluri, creme transdermice, capsule micronizate, ovule sau plasturi",
            "Explicarea modului de utilizare și a eventualelor efecte secundare",
            "Pacienta începe terapia conform schemei personalizate",
            "Primele săptămâni sunt de adaptare, pot exista mici variații de simptome",
            "Este esențial ca pacienta să noteze schimbările observate (somn, bufeuri, energie, dispoziție)"
          ]}
        />

        <.detailed_process_step
          step="3"
          title="Monitorizare periodică"
          bg_color="from-pink-500 to-pink-600"
          items={[
            "Control lunar, la 4-6 săptămâni după inițiere pentru a ajusta dozele",
            "Ulterior, controale la fiecare 3–6 luni, cu repetarea analizelor hormonale și a investigațiilor imagistice, dacă e cazul",
            "Ajustarea dozelor până la atingerea echilibrului optim (simptome reduse + analize în parametri)",
            "Tratamentul nu este identic pentru toată viața – dozele se ajustează în funcție de vârstă, analize și evoluția clinică",
            "Integrarea BHRT cu nutriție echilibrată, sport, suplimente recomandate, reducerea stresului și screening regulat",
            "Obiectivul nu este doar ameliorarea simptomelor, ci și longevitatea sănătoasă: prevenirea osteoporozei, bolilor cardiovasculare și cognitive"
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
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <.detailed_administration_card
          emoji="💊"
          title="Capsule (progesteron micronizat, melatonină)"
          advantages="dozaj precis, administrare simplă"
          ideal_for="femei care au nevoie de progesteron pentru protecția endometrului și somn odihnitor"
          bg_color="bg-blue-50"
          border_color="border-blue-200"
          title_color="text-blue-800"
          advantage_color="text-blue-600"
        />

        <.detailed_administration_card
          emoji="🧴"
          title="Creme și geluri transdermice (estrogen, progesteron, testosteron)"
          advantages="absorbție rapidă, evită ficatul, efecte mai blânde și stabile"
          ideal_for="paciente cu probleme hepatice/digestive sau care preferă aplicarea locală"
          bg_color="bg-green-50"
          border_color="border-green-200"
          title_color="text-green-800"
          advantage_color="text-green-600"
        />

        <.detailed_administration_card
          emoji="🏥"
          title="Plasturi transdermici (estrogen, combinații)"
          advantages="eliberare constantă, aplicare 1–2 ori/săptămână, comod"
          ideal_for="femei care vor stabilitate hormonală și nu doresc administrare zilnică"
          bg_color="bg-purple-50"
          border_color="border-purple-200"
          title_color="text-purple-800"
          advantage_color="text-purple-600"
        />

        <.detailed_administration_card
          emoji="🌸"
          title="Ovule vaginale (estriol, DHEA)"
          advantages="acțiune locală directă, reduc uscăciunea și atrofia vaginală"
          ideal_for="femei cu simptome genito-urinare (disconfort intim, durere la contact)"
          bg_color="bg-pink-50"
          border_color="border-pink-200"
          title_color="text-pink-800"
          advantage_color="text-pink-600"
        />

        <.detailed_administration_card
          emoji="💨"
          title="Spray nazal/sublingual (oxitocină)"
          advantages="efect rapid asupra dispoziției și conexiunii emoționale"
          ideal_for="femei cu anxietate, scădere a dorinței sexuale sau dificultăți în relaxare/afecțiune"
          bg_color="bg-orange-50"
          border_color="border-orange-200"
          title_color="text-orange-800"
          advantage_color="text-orange-600"
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
        <.detailed_safety_card
          emoji="✅"
          title="Candidați Ideali pentru BHRT"
          bg_color="bg-green-50"
          border_color="border-green-200"
          title_color="text-green-800"
          items={[
            "Femei aflate în perimenopauză sau menopauză cu simptome moderate–severe (bufeuri, insomnie, schimbări de dispoziție, uscăciune vaginală)",
            "Paciente cu risc crescut de osteoporoză sau pierdere de masă osoasă",
            "Femei care doresc să-și mențină calitatea vieții și sănătatea pe termen lung (sistem cardiovascular, piele, creier)",
            "Persoane care preferă o alternativă bioidentică, mai bine tolerată decât hormonii sintetici"
          ]}
          item_color="text-green-700"
          bullet_color="text-green-500"
        />

        <.detailed_safety_card
          emoji="⚠️"
          title="Contraindicații și Precauții"
          bg_color="bg-red-50"
          border_color="border-red-200"
          title_color="text-red-800"
          subtitle="BHRT NU este recomandată în următoarele situații:"
          items={[
            "Cancer mamar sau uterin activ/antecedente recente",
            "Tromboembolism venos sau accident vascular cerebral în antecedente",
            "Afecțiuni hepatice severe",
            "Sângerări vaginale neexplicate",
            "Sarcină sau alăptare"
          ]}
          warning="Precauție: femeile cu istoric familial de cancer mamar, boli cardiovasculare sau factori de risc multipli pot beneficia de BHRT doar după evaluare și monitorizare strictă"
          item_color="text-red-700"
          bullet_color="text-red-500"
        />

        <.detailed_safety_card
          emoji="🔍"
          title="Monitorizare Necesară"
          bg_color="bg-blue-50"
          border_color="border-blue-200"
          title_color="text-blue-800"
          subtitle="Pentru a asigura eficiență și siguranță, BHRT necesită:"
          items={[
            "Analize de sânge hormonale și metabolice (estradiol, progesteron, testosteron, DHEA-S, profil lipidic, funcție hepatică/renală etc.) – inițial și apoi periodic",
            "Ecografie transvaginală pentru monitorizarea endometrului",
            "Screening mamar (ecografie sau mamografie, în funcție de vârstă)",
            "Consultații regulate (la 4-8 săptămâni după inițiere, apoi la 3–6 luni)",
            "Ajustarea dozelor în funcție de simptome și rezultate"
          ]}
          item_color="text-blue-700"
          bullet_color="text-blue-500"
        />
      </div>
      
      <div class="mt-12 text-center">
        <div class="bg-gradient-to-br from-green-50 to-blue-50 rounded-2xl p-8 max-w-4xl mx-auto">
          <p class="text-lg text-gray-800 leading-relaxed flex items-center justify-center">
            <span class="text-2xl mr-3">✅</span>
            <span>BHRT este considerată sigură atunci când este corect indicată și atent monitorizată. Nu există „o schemă universală", ci un tratament personalizat, adaptat la fiecare femeie.</span>
          </p>
        </div>
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

  defp detailed_benefit_card(assigns) do
    ~H"""
    <div class="bg-white rounded-xl p-6 shadow-sm h-full flex flex-col">
      <div class={"w-12 h-12 #{@bg_color} rounded-lg flex items-center justify-center mb-4"}>
        <span class="text-2xl">{@emoji}</span>
      </div>
      <h4 class="font-semibold text-gray-900 mb-3">{@title}</h4>
      <p class="text-sm text-gray-600 leading-relaxed flex-grow">{@description}</p>
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
  attr :types, :list, required: true
  attr :role, :string, required: true
  attr :forms, :string, required: true
  attr :forms_bg, :string, required: true
  attr :forms_text_color, :string, required: true
  attr :forms_title_color, :string, required: true

  defp detailed_hormone_card(assigns) do
    ~H"""
    <div class={"#{@bg_color} rounded-xl p-8 border #{@border_color}"}>
      <div class="flex items-center mb-6">
        <span class="text-2xl mr-3">{@emoji}</span>
        <h4 class={"text-xl font-bold #{@title_color}"}>{@title}</h4>
      </div>

      <div class="mb-6">
        <%= for {hormone_name, description} <- @types do %>
          <div class="mb-4">
            <p class={"text-sm #{@title_color} font-semibold mb-1"}>
              • {hormone_name}
            </p>
            <p class="text-sm text-gray-600 pl-4">
              {description}
            </p>
          </div>
        <% end %>
      </div>

      <div class="mb-4">
        <p class={"text-sm #{@title_color} font-semibold mb-2"}>👉 Rol:</p>
        <p class="text-sm text-gray-600">{@role}</p>
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

  defp basic_hormone_card(assigns) do
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

  attr :step, :string, required: true
  attr :title, :string, required: true
  attr :bg_color, :string, required: true
  attr :items, :list, required: true

  defp detailed_process_step(assigns) do
    ~H"""
    <div class="relative h-full">
      <div class={"bg-gradient-to-br #{@bg_color} text-white rounded-xl p-8 h-full flex flex-col"}>
        <div class="text-center mb-6">
          <div class="w-16 h-16 bg-white bg-opacity-20 rounded-full flex items-center justify-center mx-auto mb-4">
            <span class="text-2xl font-bold">{@step}</span>
          </div>
          <h4 class="text-xl font-semibold mb-4">{@title}</h4>
        </div>
        <ul class="text-sm space-y-3 leading-relaxed flex-grow">
          <%= for item <- @items do %>
            <li class="flex items-start">
              <span class="text-white mr-3 mt-1 flex-shrink-0">•</span>
              <span>{item}</span>
            </li>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end

  attr :emoji, :string, required: true
  attr :title, :string, required: true
  attr :advantages, :string, required: true
  attr :ideal_for, :string, required: true
  attr :bg_color, :string, required: true
  attr :border_color, :string, required: true
  attr :title_color, :string, required: true
  attr :advantage_color, :string, required: true

  defp detailed_administration_card(assigns) do
    ~H"""
    <div class={"#{@bg_color} border #{@border_color} rounded-xl p-6 h-full flex flex-col hover:shadow-lg transition-shadow"}>
      <div class="text-center mb-6">
        <span class="text-4xl mb-3 block">{@emoji}</span>
        <h4 class={"text-lg font-semibold #{@title_color} leading-tight"}>{@title}</h4>
      </div>
      <div class="space-y-4 text-sm flex-grow">
        <div>
          <p class={"font-semibold #{@advantage_color} mb-2"}>Avantaje:</p>
          <p class="text-gray-700">{@advantages}</p>
        </div>
        <div>
          <p class={"font-semibold #{@advantage_color} mb-2"}>Ideal pentru:</p>
          <p class="text-gray-700">{@ideal_for}</p>
        </div>
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
  attr :subtitle, :string, default: nil
  attr :warning, :string, default: nil

  defp detailed_safety_card(assigns) do
    ~H"""
    <div class={"#{@bg_color} rounded-xl p-8 border #{@border_color} h-full flex flex-col"}>
      <div class="flex items-center mb-6">
        <span class="text-3xl mr-3">{@emoji}</span>
        <h4 class={"text-xl font-bold #{@title_color}"}>{@title}</h4>
      </div>

      <%= if @subtitle do %>
        <div class="mb-4">
          <p class={"text-sm font-semibold #{@title_color}"}>{@subtitle}</p>
        </div>
      <% end %>

      <ul class={"space-y-3 #{@item_color} flex-grow"}>
        <%= for item <- @items do %>
          <li class="flex items-start">
            <span class={"#{@bullet_color} mr-3 mt-1 flex-shrink-0"}>•</span>
            <span class="text-sm leading-relaxed">{item}</span>
          </li>
        <% end %>
      </ul>

      <%= if @warning do %>
        <div class="mt-6 p-4 bg-white bg-opacity-50 rounded-lg border border-current border-opacity-20">
          <p class={"text-sm #{@title_color} font-semibold"}>
            👉 {@warning}
          </p>
        </div>
      <% end %>
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
