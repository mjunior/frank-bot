describe FaqModule::RemoveService do
  before do
    @company = create(:company)
  end

  describe '#call' do
    it 'With valid ID, remove FAQ return message' do
      faq = create(:faq, company: @company)

      @removeService = FaqModule::RemoveService.new({id: faq.id})
      response = @removeService.call()

      expect(response).to match('Deletado com sucesso')
    end

    it 'With valid ID, remove FAQ from database' do
      faq = create(:faq, company: @company)
      @removeService = FaqModule::RemoveService.new({id: faq.id})
      expect(Faq.count).to eql(1)
      response = @removeService.call()
      expect(Faq.count).to eql(0)
    end

    it 'With INVALID id' do
      @removeService = FaqModule::RemoveService.new({id: -999})
      response = @removeService.call()

      expect(response).to match('Questão não encontrada')
    end
  end
end