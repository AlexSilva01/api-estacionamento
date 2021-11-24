module Api 
    module V1
        class MovimentacaoController < ApplicationController
            def index
                movimentacao = MovimentacaoVeiculo.order('id ASC')
                render json: {status: 'SUCCESS', message: 'Movimentações carregadas', data: movimentacao}, status: :ok
            end
        end
    end
end