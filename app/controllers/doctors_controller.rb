class DoctorsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index
  before_action :set_doctor, only: %i[destroy show edit update]

  def index
    @doctors = User.where(role: true)
    # The `geocoded` scope filters only flats with coordinates
    @markers = @doctors.geocoded.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude
      }
    end
  end

  def new
    @doctor = Doctor.new
  end

  def show
    @doctor = Doctor.find(params[:id])
    @user = User.find(@doctor.user_id)

    # Asegúrate de que el usuario tenga la geolocalización (latitude y longitude) antes de intentar mostrarla
    if @user.latitude.present? && @user.longitude.present?
      @marker = { lat: @user.latitude, lng: @user.longitude }
    end
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

  def edit; end

  def update
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
    params.require(:doctor).permit(:sap, :specialty)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
