require 'rails_helper'

RSpec.describe ChuckNorris, type: :model do
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
end
