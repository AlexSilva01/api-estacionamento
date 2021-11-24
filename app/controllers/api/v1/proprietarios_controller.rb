module Api 
    module V1
        class ProprietariosController < ApplicationController
            def index
                proprietarios = Proprietario.order('id ASC')
                render json: {status: 'SUCCESS', message: 'Proprietarios carregados', data: proprietarios}, status: :ok
            end
        end
    end
end