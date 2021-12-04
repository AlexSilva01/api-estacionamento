module Api 
    module V1
        class MovimentacaoController < ApplicationController
            def index
                movimentacao = MovimentacaoVeiculo.order('id ASC')
                render json: {status: 'SUCCESS', message: 'Movimentações carregadas', data: movimentacao}, status: :ok
            end
            def show
                movimentacao = MovimentacaoVeiculo.find(params[:id])
                render json: {status: 'Sucess', message: 'Movimentação carregada', data: movimentacao}, status: :ok
            end
            def create
                movimentacao = MovimentacaoVeiculo.new(movimentacao_params)
                if movimentacao.save
                    render json: {status: 'Sucess', message: 'Movimentação salva', data: movimentacao}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Movimentação não salva', data: movimentacao.errors}, status: :unprocessable_entity
                end
            end
            def update
                movimentacao = MovimentacaoVeiculo.find(params[:id])
                if movimentacao.update
                    render json: {status: 'Sucess', message: 'Movimentação atualizada', data: movimentacao}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Movimentação não atualizada', data: movimentacao.errors}, status: :unprocessable_entity
                end
            end
            def destroy
                movimentacao = MovimentacaoVeiculo.find(params[:id])
                movimentacao.destroy
                render json: {status: 'Sucess', message: 'Movimentação atualizada', data: movimentacao}, status: :ok
            end

            private

            def movimentacao_params
                params.permit(:historico_entrada_saida)
            end
        end
    end
end