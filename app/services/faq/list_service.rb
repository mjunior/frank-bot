module FaqModule
  class ListService
    def initialize(params, action)
      # TODO: identify origin and set company
      @company = Company.last
      @action = action
      @query = params[:query]
    end

    def call
      case @action
        when "search"
          faqs = Faq.search(@query).where(company: @company)
        when "search_by_hashtag"
          faqs = @company.faqs.select do |faq|
            faq.hashtags.detect do |hashtag|
              hashtag.name == @query
            end
          end
        else
          faqs = @company.faqs
        end

      response = "*Perguntas e Respostas* \n\n"
      faqs.each do |f|
        response += "*#{f.id}* - "
        response += "*#{f.question}*\n"
        response += ">#{f.answer}\n"
        f.hashtags.each do |h|
          response += "_##{h.name}_ "
        end
        response += "\n\n"
      end
      (faqs.count > 0) ? response : "Nada encontrado"
    end
  end
end