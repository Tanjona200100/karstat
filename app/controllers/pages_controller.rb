class PagesController < ApplicationController
    def home
        # Affiche la vue de la carte
    end
    def geojson_data
     # file_name = params[:file] || 'my_data'
      #file_name = 'my_data'
      #file_path = Rails.root.join('public', 'geojson', "#{file_name}.geojson")
      file_path = Rails.root.join('public', 'geojson', "madagascar.geojson")
      print(file_path)
      if File.exist?(file_path)
        render json: JSON.parse(File.read(file_path))
      else
        render json: { error: 'Fichier introuvable' }, status: 404
      end
    end
  end