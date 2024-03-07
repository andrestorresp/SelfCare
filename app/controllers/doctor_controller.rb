class DoctorController < ApplicationController

  skip_before_action :authenticate_user!, only: :index
  before_action :set_doctor, only: :destroy
  # before_action :set_doctor, only: %i[new create]

  def index
    @doctors = doctor.all
    # if params[:query].present?
    #  @doctors = Doctor.doctor_search(params[:query])
    # end
  end

  def new
    @doctor = Doctor.new
  end

  def show
    @doctor = Doctor.find(params[:id])
    @consultations = consultations.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user_id = current_user.id
    if @doctor.save
      redirect_to doctors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor), notice: 'doctor actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path, status: :see_other, notice: 'doctor eliminado exitosamente.'
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name) # terminar de anexar lo que falta dentro de permit
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
