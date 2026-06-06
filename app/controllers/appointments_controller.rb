class AppointmentsController < ApplicationController
    def index
        if params[:patient_id]
            patient = Patient.find(params[:patient_id])
            patient_appts = patient.appointments
            render json: patient_appts
        elsif params[:provider_id]
            provider = Provider.find(params[:provider_id])
            provider_appts = provider.appointments
            render json: provider_appts
        else
            appointments = Appointment.all
            render json: appointments
        end
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Not Found'}, status: :not_found
    end

    def create
        appointment = Appointment.new(appointment_params)
        if appointment.save
            render json: appointment, status: :created
        else
            render json: appointment.errors, status: :unprocessable_entity
        end
    end

    def show
        appointment = Appointment.find(params[:id])
        render json: appointment
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Appointment not found'}, status: :not_found
    end

    def update
        appointment = Appointment.find(params[:id])
        if appointment.update(appointment_params)
            render json: appointment, status: :ok
        else
            render json: appointment.errors, status: :unprocessable_entity
        end
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Appointment not found'}, status: :not_found
    end

    def destroy
        appointment = Appointment.find(params[:id])
        provider.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Appointment not found'}, status: :not_found
    end

    private
    def appointment_params
        params.require(:appointment).permit(:patient_id, :provider_id, :appointment_date, :status, :notes)
    end
end
