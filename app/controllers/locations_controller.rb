class LocationsController < ApplicationController

    def new

    end

    def create
        require 'csv'
        require 'date'

        #logger.debug "params: #{params}"
        input_files = params[:inputFiles]
        @employee = Employee.where("name = ? AND eid = ?", params[:employee][:name], params[:employee][:eid]).take
        if @employee.nil?
            flash[:alert] = "Employee not found"
            redirect_to upload_path
        elsif params[:inputFiles].nil?
            flash[:alert] = "No file selected"
            redirect_to upload_path
        else
            logger.debug "#{input_files}"
            for file in input_files
                logger.debug "test"
                if File.extname(file["attributes"].path) == ".loc"
                    CSV.foreach(file["attributes"].path) do |row|
                        location = Location.new(lat: row[0], lng: row[1], time: Time.at(Integer(row[2])).to_datetime)
                        @employee.locations << location
                        @employee.save
                        location.save
                    end
                elsif File.extname(file["attributes"].path) == ".mp4"
                    video = Video.create(:dash_video => file["attributes"])
                    @employee.videos << video
                    @employee.save
                    video.save
                end
            end
            redirect_to home_path(@employee, 0)
        end
    end
end
