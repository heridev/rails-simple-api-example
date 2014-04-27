module API
  class V3::PatientsController < ApplicationController
    before_action :authenticate

    def index
      patients = Patient.all
      render json: patients, status: :ok
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Patients"'

      respond_to do |format|
        format.json { render json: 'Bad credentials', status: 401 }
        format.xml { render xml: 'Bad credentials', status: 401 }
      end
    end

    protected

      def authenticate
        authenticate_token || render_unauthorized
      end

      def authenticate_token
        authenticate_with_http_token do |token, options|
          User.find_by(auth_token: token)
        end
      end
  end
end

