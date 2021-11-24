module Api 
    module V1
        class HistoricoController < ApplicationController
            def index
                historicos = HistoricoEntradaSaida.order('id ASC')
                render json: {status: 'SUCCESS', message: 'Historicos carregados', data: historicos}, status: :ok
            end
        end
    end
end