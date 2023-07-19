class Settings
  class << self
    attr_reader :values

    def load(path)
      @values ||= YAML.load_file("config/settings.yml").deep_symbolize_keys
    end
  end
end
