class ConsultationsController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @consultations = Consultation.find(params[:id])
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @doctor = current_user.doctor
    @consultation = Consultation.new(consultation_params)
    @consultation.patient_id = @patient.id
    @consultation.doctor_id = @doctor.id
    if @consultation.save!
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    raise
  end

  private

  def consultation_params
    params.require(:consultation).permit(:diagnostic)
  end
end
