class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
    respond_with(@people)
  end

  def show
    @person = Person.find(params[:id])
    respond_with(@person)
  end

  def new
    @person = Person.new
    respond_with(@person)
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)
    
    if @person.save
      redirect_to people_path, notice: "The person has been successfully created"
    end
    respond_with(@person)
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      redirect_to people_path, notice: "The person has been updated"
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    respond_with(@person)
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:first_name, :last_name)
    end
end
