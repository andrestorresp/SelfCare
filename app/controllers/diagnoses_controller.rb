class DiagnosesController < ApplicationController

  def new
    @diagnosis = Diagnosis.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @diagnosis = Diagnosis.new(diagnoses_params)
    if @diagnosis.save!
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def diagnoses_params
    params.require(:diagnosis).permit(:diabetes, :hypertension, :tuberculosis, :cancer, :other_diseases, :other_details )
  end

end
