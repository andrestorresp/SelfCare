class ConsultationsController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @consultations = Consultation.find(params[:id])
  end

  def create
  end

  def update
  end
end
