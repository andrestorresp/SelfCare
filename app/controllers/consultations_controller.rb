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
    @doctor = current_user
    @consultation = Consultation.new
    @consultation.patient_id = @patient.id
    @consultation.doctor_id = @doctor.id
    @consultation.diagnostic = params[:consultation][:diagnostic]
    puts "Donde esta el puuts?"+@consultation.inspect
    if @consultation.save
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end
end
