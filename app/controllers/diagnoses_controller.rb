class DiagnosesController < ApplicationController

  def new
    @diagnosis = Diagnosis.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @diagnosis = Diagnosis.new(diagnoses_params)
    @diagnosis.patient = @patient

    if params[:diagnosis][:diabetes_true] == "1"
      @diagnosis.diabetes = true
    elsif params[:diagnosis][:diabetes_false] == "1"
      @diagnosis.diabetes = false
    end

    if params[:diagnosis][:hypertension_true] == "1"
      @diagnosis.hypertension = true
    elsif params[:diagnosis][:hypertension_false] == "1"
      @diagnosis.hypertension = false
    end

    if params[:diagnosis][:tuberculosis_true] == "1"
      @diagnosis.tuberculosis = true
    elsif params[:diagnosis][:tuberculosis_false] == "1"
      @diagnosis.tuberculosis = false
    end

    if params[:diagnosis][:cancer_true] == "1"
      @diagnosis.cancer = true
    elsif params[:diagnosis][:cancer_false] == "1"
      @diagnosis.cancer = false
    end
    if @diagnosis.save!
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def diagnoses_params
    params.require(:diagnosis).permit(:diabetes_true, :diabetes_false, :hypertension_true, :hypertension_false, :tuberculosis_true, :tuberculosis_false, :cancer_true, :cancer_false, :other_diseases, :other_details )
  end

end
