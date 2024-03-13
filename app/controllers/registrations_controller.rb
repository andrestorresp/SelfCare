class RegistrationsController < Devise::RegistrationsController

  def create
    super do |resource|
      if resource.persisted?
        sign_in(resource_name, resource) unless user_signed_in?

          if resource.role == false
            @patient = Patient.new
            @patient.user = current_user
            @patient.save
            return redirect_to new_patient_diagnosis_path(@patient)
          else
            return redirect_to new_doctor_path
          end
      end
    end
  end

  def new
    super
  end


end
