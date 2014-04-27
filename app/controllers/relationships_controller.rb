class RelationshipsController < ApplicationController
  include SessionsHelper
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]


  # GET /relationships
  def index
    # @relationships = Relationship.all
    @requested_relationships = Relationship.where(:requesting_user_id => params[:user_id])
    @received_relationships = Relationship.where(:receiving_user_id => params[:user_id])
    @confirmed_relationships = Relationship.where(:confirmed => "true")
  end

  # GET /relationships/1
  def show

  end

  # GET /relationships/new
  def new
    # create two relationships to add to table
    # @received_relationship = Relationship.new #owned by receiver
    @requested_relationship = Relationship.new #owned by requester

    # set each relationship's receiving and requesting id
    # @received_relationship.receiving_user_id = params[:user_id]
    # @received_relationship.requesting_user_id = current_user.id
    # @received_relationship.confirmed = false

    @requested_relationship.receiving_user_id = params[:user_id]
    @requested_relationship.requesting_user_id = current_user.id
    @requested_relationship.confirmed = false

    # set user variables
    @requesting_user = User.find_by(current_user.id)
    @receiving_user = User.find_by(params[:user_id])


    if @requested_relationship.save
      redirect_to user_relationships_path(current_user.id), notice: "Friend Request sent to #{@receiving_user.name_first} #{@receiving_user.name_last}!"
    end

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
    redirect_to user_relationships_url, notice: 'Relationship was successfully destroyed.'
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
