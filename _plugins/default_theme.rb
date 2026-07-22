# frozen_string_literal: true

module DefaultTheme
  VALID_THEMES = %w[dark light system].freeze

  def self.inject(document)
    return unless document.output_ext == ".html"

    default_theme = document.site.config["default_theme"]
    return unless VALID_THEMES.include?(default_theme)

    script = <<~HTML
      <script>
        try {
          if (localStorage.getItem("theme") === null) {
            localStorage.setItem("theme", "#{default_theme}");
          }
        } catch (_error) {}
      </script>
    HTML

    document.output = document.output.sub("<head>", "<head>\n#{script}")
  end
end

%i[pages documents].each do |owner|
  Jekyll::Hooks.register owner, :post_render do |document|
    DefaultTheme.inject(document)
  end
end
