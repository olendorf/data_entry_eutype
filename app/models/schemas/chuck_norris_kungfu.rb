class Schemas::ChuckNorrisKungfu
  include Virtus.model

  attribute :fact, String
  attribute :knockouts, Integer

  def self.dump(kungfu)
    kungfu.to_hash
  end

  def self.load(kungfu)
    new(kungfu)
  end
end