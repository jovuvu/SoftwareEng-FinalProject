class RelationshipsController < ApplicationController
  include SessionsHelper
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]

  # GET /relationships
  def index
    @relationships = Relationship.all
  end

  def user_index
    @outgoing_relationships = Relationship.where(:requesting_user_id => current_user.id)
    @incoming_relationships = Relationship.where(:receiving_user_id => current_user.id)
    @confirmed_relationships = Relationship.where(:confirmed => true)
    
  end

  # GET /relationships/1
  def show


  end

  # GET /relationships/new
  def new
    @relationship = Relationship.new
    @relationship.requesting_user_id = current_user.id
    @relationship.receiving_user_id = params[:format]
    @relationship.confirmed = current_user.id
    @relationship.save
    redirect_to "/users/#{current_user.id}/relationships"

  end

  # GET /relationships/1/edit
  def edit
  end

  # POST /relationships
  def create
    @relationship = Relationship.new(relationship_params)

    if @relationship.save
      redirect_to @relationship, notice: 'Relationship was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /relationships/1
  def update
    if @relationship.update(relationship_params)
      redirect_to @relationship, notice: 'Relationship was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /relationships/1
  def destroy
    @relationship.destroy
    redirect_to relationships_url, notice: 'Relationship was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def relationship_params
      params[:relationship]
    end
end
