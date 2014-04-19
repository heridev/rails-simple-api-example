module API
  class PatientsController < ApplicationController
    def index
      patients = Patient.all
      if first_name = params[:first_name]
        patients = patients.where(first_name: first_name)
      end
      render json: patients, status: :ok
    end

    def show
      patient = Patient.find(params[:id])
      render json: patient, status: :ok
    end
  end
end

