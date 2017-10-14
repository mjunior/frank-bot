module FaqModule
  class RemoveService
    def initialize(params)
      @company = Company.last
      @faq = @company.faqs.where(id: params["id"]).last  
    end

    def call
      return "Questão não encontrada" if @faq.nil?
      Faq.transaction do
        # Deleta as tags associadas que não estejam associadas a outros faqs
        @faq.hashtags.each do |h|
          if h.faqs.count <= 1
            h.delete
          end
        end
        @faq.delete
        "Deletado com sucesso"
      end
    end
  end
end