class PatientsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index
  before_action :set_patient, only: %i[show edit update destroy]

  def index

    @patients = Patient.all

    # if params[:query].present?
    #   @patients = Patient.patient_search(params[:query])

    # end
  end

  def show
    @patient = Patient.find(params[:id])
    @user = User.find(@patient.user_id)
    @diagnosis = @patient.diagnosis

    @consultations = @patient.consultations
    @doctors = @consultations.map(&:doctor)

    if current_user.role
      @additional_consultations = Consultation.where(patient_id: @patient.id)
      @consultations += @additional_consultations
    end
  end


  def new
    @patient = Patient.new
    @user = current_user
    @patient.user = @user
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    if @patient.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if @patient.update(patient_params)
      redirect_to patient_path(@patient), notice: 'Paciente actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, status: :see_other, notice: 'Paciente eliminado exitosamente.'
  end

  private

  def patient_params
    params.require(:patient).permit(:alergy, :observation)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

end
