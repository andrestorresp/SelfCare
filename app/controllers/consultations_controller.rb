class ConsultationsController < ApplicationController
  def index
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def edit
    @consultation = Consultation.find(params[:id])
    @patient = @consultation.patient
  end

  def new
    @consultation = Consultation.new
  end

  


  def create
    #Se busca el paciente
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
    @consultation = Consultation.find(params[:id])

    if @consultation.update(consultation_params)
      redirect_to patient_path(@consultation.patient), notice: "Consulta actualizada correctamente"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:diagnostic)
  end
end
