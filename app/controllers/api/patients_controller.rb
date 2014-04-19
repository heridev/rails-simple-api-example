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

    def create
      patient = Patient.create!(patient_params)
      if patient
        render json: patient, status: :created
      else
        render json: patient.errors, status: :unprocessable_entity
      end
    end

    private
      def patient_params
        params.require(:patient).permit(:first_name, :last_name)
      end
  end
end

