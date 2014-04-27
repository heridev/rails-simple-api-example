module API
  class V2::PatientsController < V2::VersionController
    def index
      patients = Patient.all
      if first_name = params[:first_name]
        patients = patients.where(first_name: first_name)
      end
      render json: patients, status: :ok
    end

    def show
      patient = Patient.find_available(params[:id])
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

    def update
      patient = Patient.find(params[:id])
      if patient.update(patient_params)
        render json: patient, status: :ok
      else
        render json: episode.errors, status: 422
      end
    end

    def destroy
      ## if you want to delete from the database use this method
      #patient = Patient.find(params[:id])
      #patient.destroy
      # if you want to just change the status to not show those records and later you can retrieve those
      # records you can use this control to emulate the deletion resources
      patient = Patient.find_available(params[:id])
      patient.archive
      head 204
    end

    def get_version
      render json: "#{@remote_ip} Version two!", status: 200
    end

    private
      def patient_params
        params.require(:patient).permit(:first_name, :last_name)
      end
  end
end

