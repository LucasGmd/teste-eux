module ApplicationHelper

  def porcentagem_atividades projeto
    quantidade_total = projeto.atividades.size
    return 0 if quantidade_total.zero?
    quantidade_finalizadas = projeto.qtd_atividades_finalizadas

    (quantidade_finalizadas.to_d / quantidade_total.to_d) * 100
  end

  def botao_projeto_atrasado atrasado
    if atrasado
      content_tag(:span, 'Atrasado', class: 'alert alert-danger', style: 'padding: 5px 10px; font-size: 15px')
    else
      content_tag(:span, 'Dentro do prazo', class: 'alert alert-success', style: 'padding: 5px 10px; font-size: 15px')
    end
  end

  def check_box_atividade_finalizada finalizado
    if finalizado
      content_tag(:span, nil, class: 'glyphicon glyphicon-ok', style: 'padding: 5px 10px; font-size: 15px; color: green')
    else
      content_tag(:span, nil, class: 'glyphicon glyphicon-remove', style: 'padding: 5px 10px; font-size: 15px; color: red')
    end
  end

  def atividade_atrasada? atividade
    atividade.data_final > atividade.projeto.data_final
  end

end
