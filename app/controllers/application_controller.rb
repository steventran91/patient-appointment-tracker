class ApplicationController < ActionController::API
    before_action :authenticate 

    def authenticate
        token = request.headers['Authorization']&.split(' ')&.last
        provider = Provider.find_by(token: token)
        render json: {error: 'Unauthorized'}, status: :unauthorized unless provider
    end
end
