module UsersHelper
  def to_month number
    case number
      when "1"
        "Janeiro"
      when "2"
        "Fevereiro"
      when "3"
        "Março"
      when "4"
        "Abril"
      when "5"
        "Maio"
      when "6"
        "Junho"
      when "7"
        "Julho"
      when "8"
        "Agosto"
      when "9"
        "Setembro"
      when "10"
        "Outubro"
      when "11"
        "Novembro"
      when "12"
        "Dezembro"
    end
  end
end
