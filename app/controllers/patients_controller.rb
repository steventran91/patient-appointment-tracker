class PatientsController < ApplicationController
    # index, show, update, patient_params
    def index
        patients = Patient.all
        render json: patients
    end

    def create
        patient = Patient.new(patient_params)
        if patient.save
            render json: patient, status: :created 
        else
            render json: patient.errors, status: :unprocessable_entity
        end
    end

    def show
        patient = Patient.find(params[:id])
        render json: patient
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Patient not found'}, status: :not_found
    end

    def update
        patient = Patient.find(params[:id])
        if patient.update(patient_params)
            render json: patient, status: :ok
        else
            render json: patient.errors, status: :unprocessable_entity
        end
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Patient not found'}, status: :not_found
    end

    private 
    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :email, :date_of_birth)
    end
end
