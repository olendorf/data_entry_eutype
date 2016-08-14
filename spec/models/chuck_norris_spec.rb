require 'rails_helper'

RSpec.describe ChuckNorris, elasticsearch: true, type: :model do
  it { should_not respond_to :fact }
  it { should_not respond_to :knockouts }
  it { should respond_to :kungfu }
  
  describe 'kungfu schema' do
    let(:chuck) { FactoryGirl.create :chuck_norris }
        
    it 'should coerce knockouts to an integer' do
      expect(chuck.kungfu.knockouts).to be_a_kind_of Integer
    end
        
    it 'should coerce facts into a string' do
      expect(chuck.kungfu.fact).to be_a_kind_of String
    end
        
    it 'should retrievable kungu as a hash' do
      expect(chuck.kungfu).to be_a_kind_of Schemas::ChuckNorrisKungfu
      expect(chuck.kungfu.to_hash).to be_a_kind_of Hash
    end
  end
    
  describe 'elasticsearch indexing' do
    it 'should index the model into elasticsearch' do
      record = create :chuck_norris
      ChuckNorris.import
      ChuckNorris.__elasticsearch__.refresh_index!
        
      terms = record.kungfu.fact.split(' ')
        
      ChuckNorris.__elasticsearch__.refresh_index!
       
      expect(ChuckNorris.search(terms.sample).records.length).to eq 1
    end
        
  end
end
