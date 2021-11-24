module Api 
    module V1
        class VeiculosController < ApplicationController
            def index
                veiculos = Veiculo.order('id ASC')
                render json: {status: 'SUCCESS', message: 'Veiculos carregados', data: veiculos}, status: :ok
            end
        end
    end
end