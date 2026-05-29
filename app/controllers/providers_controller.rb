class ProvidersController < ApplicationController
    ## index, show, update, destroy, provider_params
    def index
        providers = Provider.all 
        render json: providers
    end

    def create
        provider = Provider.new(provider_params)
        if provider.save
            render json: provider, status: :created
        else
            render json: provider.errors, status: :unprocessable_entity
        end
    end

    def show
        provider = Provider.find(params[:id])
        render json: provider
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Provider not found'}, status: :not_found
    end

    def update
        provider = Provider.find(params[:id])
        if provider.update(provider_params)
            render json: provider, status: :ok 
        else
            render json: provider.errors, status: :unprocessable_entity
        end
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Provider not found'}, status: :not_found
    end

    def destroy
        provider = Provider.find(params[:id])
        provider.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Provider not found'}, status: :not_found
    end

    private 
    def provider_params
        params.require(:provider).permit(:first_name, :last_name, :specialty, :email)
    end
end
