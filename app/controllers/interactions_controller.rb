class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]

  def index
    @context = context
    @interaction = @context.interactions.new
    respond_with(@interactions)
  end

  def show
    respond_with(@interaction)
  end

  def new
    @interaction = Interaction.new
    respond_with(@interaction)
  end

  def edit
    @context = context
    @interaction = context.interactions.find(params[:id])
  end

  def create
    @context = context
    @interaction = @context.interactions.new
    
    if @interaction.save
      redirect_to context_url(context), notice: "The interation has been successfully created"
    end
    respond_with(@interaction)
  end

  def update
    @context = context
    @interaction = @context.interactions.find(params[:id])
    
    if @interaction.update_attributes(interaction_params)
      redirect_to context_url(context), notice: "The interaction has been updated"
    end
    respond_with(@interaction)
  end

  def destroy
    @interaction.destroy
    respond_with(@interaction)
  end

  private
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    def interaction_params
      params.require(:interaction).permit(:description, :interaction_id, :interaction_type)
    end

    def context
      if params[:person_id]
        id = params[:person_id]
        Person.find(params[:person_id])
      else
        id = params[:business_id]
        Business.find(params[:business_id])
      end
    end

    def context_url(context)
      if Person === context
        person_path(context)
      else
        business_path(context)
      end
    end

end
