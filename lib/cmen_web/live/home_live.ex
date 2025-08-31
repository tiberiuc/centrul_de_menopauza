defmodule CmenWeb.HomeLive do
  use CmenWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, active_menopause_section: "perimenopauza")}
  end

  @impl true
  def handle_event("scroll_to_section", %{"section" => section}, socket) do
    {:noreply, push_event(socket, "scroll-to", %{id: section})}
  end

  @impl true
  def handle_event("change_menopause_section", %{"section" => section}, socket) do
    {:noreply, assign(socket, active_menopause_section: section)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-white">
      <!-- Navigation Header -->
      <nav class="fixed top-0 w-full bg-white/95 backdrop-blur-sm border-b border-gray-100 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex justify-between items-center h-16">
            <div class="flex items-center">
              <h1 class="text-xl font-bold text-pink-600">
                <%= gettext("Centrul de Menopauză") %>
              </h1>
            </div>
            <div class="hidden md:block">
              <div class="ml-10 flex items-baseline space-x-8">
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="home"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Home") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="services"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Services") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="understanding"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Ghid Menopauză") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="about"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("About") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="contact"
                  class="text-gray-700 hover:text-pink-600 px-3 py-2 text-sm font-medium transition-colors"
                >
                  <%= gettext("Contact") %>
                </button>
              </div>
            </div>
            <div class="md:hidden">
              <button class="text-gray-700 hover:text-pink-600">
                <.icon name="hero-bars-3" class="h-6 w-6" />
              </button>
            </div>
          </div>
        </div>
      </nav>

      <!-- Hero Section -->
      <section id="home" class="pt-16 bg-gradient-to-br from-pink-50 to-purple-50 min-h-screen flex items-center">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div>
              <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold text-gray-900 leading-tight">
                <%= gettext("Your journey to wellness starts here") %>
              </h1>
              <p class="mt-6 text-xl text-gray-600 leading-relaxed">
                <%= gettext("Specialized care for menopause and women's health") %>
              </p>
              <div class="mt-8 flex flex-col sm:flex-row gap-4">
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="contact"
                  class="bg-pink-600 hover:bg-pink-700 text-white px-8 py-3 rounded-lg text-lg font-semibold transition-colors shadow-lg hover:shadow-xl"
                >
                  <%= gettext("Book Consultation") %>
                </button>
                <button
                  phx-click="scroll_to_section"
                  phx-value-section="services"
                  class="border border-pink-600 text-pink-600 hover:bg-pink-50 px-8 py-3 rounded-lg text-lg font-semibold transition-colors"
                >
                  <%= gettext("Learn More") %>
                </button>
              </div>
              
              <!-- Statistics -->
              <div class="mt-12 grid grid-cols-3 gap-8">
                <div class="text-center">
                  <div class="text-3xl font-bold text-pink-600">15+</div>
                  <div class="text-sm text-gray-600"><%= gettext("Years of Experience") %></div>
                </div>
                <div class="text-center">
                  <div class="text-3xl font-bold text-pink-600">2000+</div>
                  <div class="text-sm text-gray-600"><%= gettext("Satisfied Patients") %></div>
                </div>
                <div class="text-center">
                  <div class="text-3xl font-bold text-pink-600">10+</div>
                  <div class="text-sm text-gray-600"><%= gettext("Treatment Options") %></div>
                </div>
              </div>
            </div>
            <div class="relative">
              <div class="aspect-square bg-gradient-to-br from-pink-200 to-purple-200 rounded-full p-8 shadow-2xl">
                <div class="w-full h-full bg-white rounded-full flex items-center justify-center">
                  <.icon name="hero-heart" class="h-32 w-32 text-pink-600" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Services Section -->
      <section id="services" class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              <%= gettext("Our Services") %>
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              <%= gettext("Comprehensive care tailored to your unique needs during menopause") %>
            </p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Consultație Specializată Menopauză -->
            <div class="bg-gradient-to-br from-pink-50 to-purple-50 rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow flex flex-col h-full">
              <div class="w-16 h-16 bg-pink-600 rounded-lg flex items-center justify-center mb-6">
                <.icon name="hero-user" class="h-8 w-8 text-white" />
              </div>
              <h3 class="text-xl font-bold text-gray-900 mb-4">
                <%= gettext("Consultație Specializată Menopauză") %>
              </h3>
              <p class="text-gray-600 leading-relaxed mb-4">
                <%= gettext("Consultația de menopauză merge mult mai departe decât ginecologia clasică. Menopauza nu este o boală, ci o etapă de tranziție hormonală, dar aduce schimbări importante în întreg organismul.") %>
              </p>
              <div class="flex-grow mb-6">
                <h4 class="text-sm font-semibold text-gray-800 mb-3"><%= gettext("Ce presupune o consultație de menopauză?") %></h4>
                <ul class="text-sm text-gray-600 space-y-2">
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Evaluarea detaliată a simptomelor tipice: bufeuri, insomnie, iritabilitate, scăderea libidoului, uscăciune vaginală") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Discuție despre riscurile pe termen lung asociate deficitului hormonal: osteoporoză, boli cardiovasculare, probleme metabolice") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Analize hormonale și metabolice personalizate") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Plan de tratament și prevenție: terapie de substituție hormonală (când este indicată), tratamente non-hormonale, nutriție, stil de viață") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-pink-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Colaborare interdisciplinară (endocrinologie, cardiologie, nutriție, psihologie) pentru o abordare completă a sănătății femeii") %></span>
                  </li>
                </ul>
                <div class="mt-4 p-3 bg-pink-50 rounded-lg border-l-4 border-pink-400">
                  <p class="text-sm text-pink-800 font-medium">
                    👉 <%= gettext("Este o consultație holistică, axată pe echilibrul hormonal și longevitate, nu doar pe aparatul genital.") %>
                  </p>
                </div>
              </div>
              <div class="border-t border-gray-200 pt-4 mt-auto">
                <div class="flex items-center justify-between">
                  <span class="text-2xl font-bold text-pink-600">800 Lei</span>
                  <span class="text-sm text-gray-500">70-80 min</span>
                </div>
              </div>
            </div>

            <!-- Consultație Online Menopauză -->
            <div class="bg-gradient-to-br from-green-50 to-blue-50 rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow flex flex-col h-full">
              <div class="w-16 h-16 bg-green-600 rounded-lg flex items-center justify-center mb-6">
                <.icon name="hero-video-camera" class="h-8 w-8 text-white" />
              </div>
              <h3 class="text-xl font-bold text-gray-900 mb-4">
                <%= gettext("Consultație Online Menopauză") %>
              </h3>
              <p class="text-gray-600 leading-relaxed mb-4">
                <%= gettext("Consultația online de menopauză oferă același nivel profesional ca cea fizică, adaptată pentru confortul și intimitatea propriului cămin. Ideal pentru prima evaluare sau monitorizarea evoluției simptomelor.") %>
              </p>
              <div class="flex-grow mb-6">
                <h4 class="text-sm font-semibold text-gray-800 mb-3"><%= gettext("Ce presupune consultația online de menopauză?") %></h4>
                <ul class="text-sm text-gray-600 space-y-2">
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Evaluarea detaliată a simptomelor prin chestionar online și discuție video") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Analiză a istoricului medical și a factorilor de risc") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Recomandări personalizate pentru analize hormonale și metabolice") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Plan de tratament și prevenție: terapie de substituție hormonală (când este indicată), tratamente non-hormonale, nutriție, stil de viață") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-green-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Planificarea următorilor pași: consultații de urmărire sau evaluare fizică când este necesară") %></span>
                  </li>
                </ul>
                <div class="mt-4 p-3 bg-green-50 rounded-lg border-l-4 border-green-400">
                  <p class="text-sm text-green-800 font-medium">
                    💻 <%= gettext("Consultația se desfășoară pe platformă securizată, cu confidențialitate garantată și acces din orice locație.") %>
                  </p>
                </div>
              </div>
              <div class="border-t border-gray-200 pt-4 mt-auto">
                <div class="flex items-center justify-between">
                  <span class="text-2xl font-bold text-green-600">800 Lei</span>
                  <span class="text-sm text-gray-500">70-80 min</span>
                </div>
              </div>
            </div>

            <!-- Consultație Ginecologică -->
            <div class="bg-gradient-to-br from-purple-50 to-indigo-50 rounded-xl p-8 shadow-lg hover:shadow-xl transition-shadow flex flex-col h-full">
              <div class="w-16 h-16 bg-purple-600 rounded-lg flex items-center justify-center mb-6">
                <.icon name="hero-heart" class="h-8 w-8 text-white" />
              </div>
              <h3 class="text-xl font-bold text-gray-900 mb-4">
                <%= gettext("Consultație Ginecologică") %>
              </h3>
              <p class="text-gray-600 leading-relaxed mb-4">
                <%= gettext("Examen ginecologic complet, control preventiv anual, ecografie transvaginală și consultanță pentru sănătatea reproductivă.") %>
              </p>
              <div class="flex-grow mb-6">
                <h4 class="text-sm font-semibold text-gray-800 mb-3"><%= gettext("Ce include consultația:") %></h4>
                <ul class="text-sm text-gray-600 space-y-2">
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Examen ginecologic clinic complet") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Ecografie transvaginală de înaltă rezoluție") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Recoltare frotiu cervical (Pap test)") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Evaluarea sănătății reproductive") %></span>
                  </li>
                  <li class="flex items-start">
                    <.icon name="hero-check" class="h-4 w-4 text-purple-600 mr-2 mt-0.5 flex-shrink-0" />
                    <span><%= gettext("Recomandări pentru investigații suplimentare") %></span>
                  </li>
                </ul>
              </div>
              <div class="border-t border-gray-200 pt-4 mt-auto">
                <div class="flex items-center justify-between">
                  <span class="text-2xl font-bold text-purple-600">380 Lei</span>
                  <span class="text-sm text-gray-500">30 min</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Understanding Menopause Section -->
      <section id="understanding" class="py-20 bg-gradient-to-br from-blue-50 to-indigo-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              <%= gettext("Înțelegerea Menopauzei: Ghid Complet") %>
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto mb-12">
              <%= gettext("Cunoaște etapele și schimbările prin care trece corpul femeii în această perioadă importantă de viață") %>
            </p>

            <!-- Interactive Navigation Buttons -->
            <div class="flex justify-center space-x-4 mb-12">
              <button
                phx-click="change_menopause_section"
                phx-value-section="perimenopauza"
                class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_menopause_section == "perimenopauza", do: "bg-orange-500 text-white shadow-lg", else: "bg-white text-orange-500 border-2 border-orange-500 hover:bg-orange-50"}"}
              >
                <%= gettext("Perimenopauza") %>
              </button>
              <button
                phx-click="change_menopause_section"
                phx-value-section="menopauza"
                class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_menopause_section == "menopauza", do: "bg-red-500 text-white shadow-lg", else: "bg-white text-red-500 border-2 border-red-500 hover:bg-red-50"}"}
              >
                <%= gettext("Menopauza") %>
              </button>
              <button
                phx-click="change_menopause_section"
                phx-value-section="postmenopauza"
                class={"px-8 py-3 rounded-lg font-semibold transition-all duration-300 #{if @active_menopause_section == "postmenopauza", do: "bg-purple-500 text-white shadow-lg", else: "bg-white text-purple-500 border-2 border-purple-500 hover:bg-purple-50"}"}
              >
                <%= gettext("Postmenopauza") %>
              </button>
            </div>
          </div>

          <!-- Dynamic Content Area -->
          <div class="transition-all duration-500 ease-in-out">
            <%= case @active_menopause_section do %>
              <% "perimenopauza" -> %>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                  <!-- Placeholder cards for Perimenopauza - waiting for user content -->
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-orange-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-clock" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Ce este Perimenopauza?") %>
                    </h3>
                    <p class="text-gray-600 mb-6 leading-relaxed">
                      <%= gettext("Perimenopauza este perioada de tranziție care începe înainte de menopauză, când ovarul începe să producă mai puțin estrogen. Poate dura între 2-10 ani și se termină când menstruația se oprește complet.") %>
                    </p>
                    
                    <div class="bg-orange-50 rounded-lg p-4">
                      <h4 class="font-semibold text-orange-800 mb-2">
                        <%= gettext("Când începe?") %>
                      </h4>
                      <p class="text-sm text-orange-700">
                        <%= gettext("De obicei între 35-45 de ani, dar poate varia. Femeile fumătoare pot intra în perimenopauză cu 1-2 ani mai devreme.") %>
                      </p>
                    </div>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-orange-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-chart-bar" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Card 2 - Perimenopauză") %>
                    </h3>
                    <p class="text-gray-600">
                      <%= gettext("Conținut în așteptare...") %>
                    </p>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-orange-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-heart" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Card 3 - Perimenopauză") %>
                    </h3>
                    <p class="text-gray-600">
                      <%= gettext("Conținut în așteptare...") %>
                    </p>
                  </div>
                </div>

              <% "menopauza" -> %>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                  <!-- Placeholder cards for Menopauza - waiting for user content -->
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-red-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-fire" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Card 1 - Menopauză") %>
                    </h3>
                    <p class="text-gray-600">
                      <%= gettext("Conținut în așteptare...") %>
                    </p>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-red-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-heart" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Card 2 - Menopauză") %>
                    </h3>
                    <p class="text-gray-600">
                      <%= gettext("Conținut în așteptare...") %>
                    </p>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-red-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-shield-check" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Card 3 - Menopauză") %>
                    </h3>
                    <p class="text-gray-600">
                      <%= gettext("Conținut în așteptare...") %>
                    </p>
                  </div>
                </div>

              <% "postmenopauza" -> %>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                  <!-- Placeholder cards for Postmenopauza - waiting for user content -->
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-purple-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-sparkles" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Card 1 - Postmenopauză") %>
                    </h3>
                    <p class="text-gray-600">
                      <%= gettext("Conținut în așteptare...") %>
                    </p>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-purple-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-academic-cap" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Card 2 - Postmenopauză") %>
                    </h3>
                    <p class="text-gray-600">
                      <%= gettext("Conținut în așteptare...") %>
                    </p>
                  </div>
                  
                  <div class="bg-white rounded-xl p-8 shadow-lg">
                    <div class="w-16 h-16 bg-purple-500 rounded-lg flex items-center justify-center mb-6">
                      <.icon name="hero-sun" class="h-8 w-8 text-white" />
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-4">
                      <%= gettext("Card 3 - Postmenopauză") %>
                    </h3>
                    <p class="text-gray-600">
                      <%= gettext("Conținut în așteptare...") %>
                    </p>
                  </div>
                </div>
            <% end %>
          </div>
        </div>
      </section>

      <!-- About Section -->
      <section id="about" class="py-20 bg-gray-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div>
              <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
                <%= gettext("About Our Center") %>
              </h2>
              <p class="text-lg text-gray-600 leading-relaxed mb-8">
                <%= gettext("We are dedicated to providing compassionate, evidence-based care for women experiencing menopause. Our team of specialists understands the unique challenges of this life transition and offers personalized treatment plans.") %>
              </p>
              <div class="space-y-4">
                <div class="flex items-center">
                  <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
                  <span class="text-gray-700"><%= gettext("Evidence-based treatments") %></span>
                </div>
                <div class="flex items-center">
                  <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
                  <span class="text-gray-700"><%= gettext("Personalized care plans") %></span>
                </div>
                <div class="flex items-center">
                  <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
                  <span class="text-gray-700"><%= gettext("Experienced specialists") %></span>
                </div>
                <div class="flex items-center">
                  <.icon name="hero-check-circle" class="h-6 w-6 text-green-600 mr-3" />
                  <span class="text-gray-700"><%= gettext("Holistic approach") %></span>
                </div>
              </div>
            </div>
            <div class="relative">
              <div class="aspect-video bg-gradient-to-br from-pink-100 to-purple-100 rounded-xl shadow-xl">
                <div class="w-full h-full flex items-center justify-center">
                  <.icon name="hero-academic-cap" class="h-24 w-24 text-pink-600" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Contact Section -->
      <section id="contact" class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center mb-16">
            <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              <%= gettext("Get in Touch") %>
            </h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
              <%= gettext("Ready to take the next step in your wellness journey? Contact us today to schedule your consultation.") %>
            </p>
          </div>

          <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
            <!-- Contact Information -->
            <div class="space-y-8">
              <div class="flex items-start">
                <div class="w-12 h-12 bg-pink-600 rounded-lg flex items-center justify-center mr-4">
                  <.icon name="hero-phone" class="h-6 w-6 text-white" />
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-2">
                    <%= gettext("Phone") %>
                  </h3>
                  <p class="text-gray-600">+40 21 123 4567</p>
                </div>
              </div>

              <div class="flex items-start">
                <div class="w-12 h-12 bg-pink-600 rounded-lg flex items-center justify-center mr-4">
                  <.icon name="hero-envelope" class="h-6 w-6 text-white" />
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-2">
                    <%= gettext("Email") %>
                  </h3>
                  <p class="text-gray-600">contact@centrul-menopauza.ro</p>
                </div>
              </div>

              <div class="flex items-start">
                <div class="w-12 h-12 bg-pink-600 rounded-lg flex items-center justify-center mr-4">
                  <.icon name="hero-map-pin" class="h-6 w-6 text-white" />
                </div>
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 mb-2">
                    <%= gettext("Address") %>
                  </h3>
                  <p class="text-gray-600">Bd. Magheru 15, București, România</p>
                </div>
              </div>
            </div>

            <!-- Contact Form -->
            <div class="bg-gradient-to-br from-pink-50 to-purple-50 rounded-xl p-8">
              <form class="space-y-6">
                <div>
                  <label for="name" class="block text-sm font-medium text-gray-700 mb-2">
                    <%= gettext("Name") %>
                  </label>
                  <input
                    type="text"
                    id="name"
                    name="name"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
                    placeholder={gettext("Your name")}
                  />
                </div>

                <div>
                  <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
                    <%= gettext("Email") %>
                  </label>
                  <input
                    type="email"
                    id="email"
                    name="email"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
                    placeholder={gettext("Your email")}
                  />
                </div>

                <div>
                  <label for="phone" class="block text-sm font-medium text-gray-700 mb-2">
                    <%= gettext("Phone") %>
                  </label>
                  <input
                    type="tel"
                    id="phone"
                    name="phone"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
                    placeholder={gettext("Your phone number")}
                  />
                </div>

                <div>
                  <label for="message" class="block text-sm font-medium text-gray-700 mb-2">
                    <%= gettext("Message") %>
                  </label>
                  <textarea
                    id="message"
                    name="message"
                    rows="4"
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
                    placeholder={gettext("How can we help you?")}
                  ></textarea>
                </div>

                <button
                  type="submit"
                  class="w-full bg-pink-600 hover:bg-pink-700 text-white px-8 py-3 rounded-lg text-lg font-semibold transition-colors shadow-lg hover:shadow-xl"
                >
                  <%= gettext("Schedule Appointment") %>
                </button>
              </form>
            </div>
          </div>
        </div>
      </section>

      <!-- Footer -->
      <footer class="bg-gray-900 text-white py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center">
            <h3 class="text-xl font-bold mb-4">
              <%= gettext("Centrul de Menopauză") %>
            </h3>
            <p class="text-gray-400 mb-6">
              <%= gettext("Specialized care for menopause and women's health") %>
            </p>
            <div class="border-t border-gray-700 pt-6">
              <p class="text-gray-400 text-sm">
                © 2025 <%= gettext("Centrul de Menopauză") %>. <%= gettext("All rights reserved.") %>
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>
    """
  end
end
