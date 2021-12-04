module Api 
    module V1
        class ProprietariosController < ApplicationController
            def index
                proprietarios = Proprietario.order('id ASC')
                render json: {status: 'SUCCESS', message: 'Proprietarios carregados', data: proprietarios}, status: :ok
            end
            def show
                proprietario = Proprietario.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Proprietario carregado', data: proprietario}, status: :ok
            end
            def create
                proprietario = Proprietario.new(proprietario_params)
                if proprietario.save
                    render json: {status: 'SUCCESS', message: 'Proprietario salvo', data: proprietario}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Proprietario não salvo', data: proprietario.errors}, status: :unprocessable_entity
                end
            end
            def update
                proprietario = Proprietario.find(params[:id])
                if proprietario.update(proprietario_params)
                    render json: {status: 'SUCCESS', message: 'Proprietario atualizado', data: proprietario}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Proprietario não atualizado', data: proprietario}, status: :unprocessable_entity
                end
            end
            def destroy
                proprietario = Proprietario.find(params[:id])
                proprietario.destroy
                render json: {status: 'SUCCESS', message: 'Proprietario excluído', data: proprietario}, status: :ok
            end

            private

            def proprietario_params
                params.permit(:nome, :bloco, :apartamento, :morador)
            end
        end
    end
end