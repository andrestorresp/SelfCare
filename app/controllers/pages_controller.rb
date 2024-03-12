class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def doctors
    @doctors = User.where(role: true)
    # The `geocoded` scope filters only flats with coordinates
    @markers = @doctors.geocoded.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude
      }
    end
  end
end
