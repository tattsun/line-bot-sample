require "yaml"

class Config
  def initialize(filename = "./config.yml")
    @config = YAML.load_file(filename)
  end

  def [](key)
    @config[key]
  end
end
