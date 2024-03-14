class Diagnosis < ApplicationRecord
  belongs_to :patient
  attr_accessor :diabetes_true, :diabetes_false
  attr_accessor :hypertension_true, :hypertension_false
  attr_accessor :tuberculosis_true, :tuberculosis_false
  attr_accessor :cancer_true, :cancer_false


end
