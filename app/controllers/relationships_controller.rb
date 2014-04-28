class RelationshipsController < ApplicationController
  include SessionsHelper
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]


  # GET /relationships
  def index
    # @relationships = Relationship.all
    @received_relationships = Relationship.where(:receiving_user_id => params[:user_id])
    @requested_relationships = Relationship.where(:requesting_user_id => params[:user_id])
    @confirmed_relationships = Relationship.where(:confirmed => "true")
  end

  # GET /relationships/1
  def show

  end

  # GET /relationships/new
  def new



    # create relationship
    @relationship = Relationship.new
    @relationship.receiving_user_id = params[:user_id]
    @relationship.requesting_user_id = current_user.id
    @relationship.confirmed = false

    # set user variables
    @receiving_user = User.find(@relationship.receiving_user_id)
    @requesting_user = User.find(@relationship.requesting_user_id)

    received = @receiving_user.add_relationship(@relationship)
    requested = @requesting_user.add_relationship(@relationship)

    # if @requested_relationship.save
    #   # redirect_to user_relationships_path(current_user.id), notice: "Friend Request sent to #{@receiving_user.name_first} #{@receiving_user.name_last}!"
    # end

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
    redirect_to user_relationships_url(current_user), notice: 'Relationship was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def relationship_params
      # params[:relationship]
      params.require(:relationship).permit(:receiving_user_id, :requesting_user_id, :confirmed)
    end
end
