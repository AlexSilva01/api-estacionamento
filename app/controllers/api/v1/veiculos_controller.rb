module Api 
    module V1
        class VeiculosController < ApplicationController
            def index
                veiculos = Veiculo.order('id ASC')
                render json: {status: 'SUCCESS', message: 'Veiculos carregados', data: veiculos}, status: :ok
            end
            def show
                veiculo = Veiculo.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Veiculo carregado', data: veiculo}, status: :ok
            end
            def create
                proprietario = Proprietario.find(params[:proprietario])
                veiculo_params[:proprietario] = proprietario

                veiculo = Veiculo.new(veiculo_params)
                if veiculo.save
                    render json: {status: 'SUCCESS', message: 'Veiculo salvo', data: veiculo}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Veiculo não salvo', data: veiculo}, status: :unprocessable_entity
                end
            end
            def update
                veiculo = Veiculo.find(params[:id])
                if veiculo.update(veiculo_params)
                    render json: {status: 'SUCCESS', message: 'Veiculo atualizado', data: veiculo}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Veiculo não atualizado', data: veiculo}, status: :unprocessable_entity
                end
            end
            def destroy
                veiculo = Veiculo.find(params[:id])
                veiculo.destroy
                render json: {status: 'SUCCESS', message: 'Veiculo excluído', data: veiculo}, status: :ok
            end

            private 

            def veiculo_params
                params.permit(:proprietario, :placa, :cor, :modelo)
            end
        end
    end
end