module Api 
    module V1
        class HistoricoController < ApplicationController
            def index
                historicos = HistoricoEntradaSaida.order('id ASC')
                render json: {status: 'SUCCESS', message: 'Historicos carregados', data: historicos}, status: :ok
            end
            def create
                placa = params[:placa]
                veiculo = Veiculo.find_by(placa: placa)
                isEntrada = params[:isEntrada]

                if isEntrada == "true"
                    historico = HistoricoEntradaSaida.new(veiculo: veiculo, dataEntrada: DateTime.now, isEntrada: isEntrada)
                else 
                    historico = HistoricoEntradaSaida.new(veiculo: veiculo, dataSaida: DateTime.now, isEntrada: isEntrada)
                end
                if historico.save
                    render json: {status: 'Sucess', message: 'Historico salvo', data: historico}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Historico não salvo', data: historico.errors}, status: :unprocessable_entity
                end
            end
        end
    end
end