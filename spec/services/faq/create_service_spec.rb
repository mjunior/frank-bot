require_relative './../../spec_helper.rb'

describe FaqModule::CreateService do
  before do
    @company = create(:company)

    @question = FFaker::Lorem.sentence
    @answer = FFaker::Lorem.sentence
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
  end


  describe '#call' do
    it 'Without hashtag params, will receive a error' do
     
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer})
        
      response = @createService.call()
      expect(response).to match("Hashtag Obrigatória")
    end

    it 'With valid params, receive success message' do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "hashtags-original" => @hashtags})

      response = @createService.call()
      expect(response).to match("Criado com sucesso")
    end

    it 'With valid params, find question and answer in database' do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "hashtags-original" => @hashtags})
     
      response = @createService.call()
      expect(Faq.last.question).to match(@question)
      expect(Faq.last.answer).to match(@answer)
    end

    it "With valid params, hashtags are created" do
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "hashtags-original" => @hashtags})

      response = @createService.call()
      expect(@hashtags.split(/[\s,]+/).first).to match(Hashtag.first.name)
      expect(@hashtags.split(/[\s,]+/).last).to match(Hashtag.last.name)
    end

  end
  
end