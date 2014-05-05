class RelationshipsController < ApplicationController
  include SessionsHelper
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]

  def user_index
  end

  # GET /relationships/1
  def show
  end

  # GET /relationships/new
  def new
    params[:relationship] = {:requesting_user_id => current_user.id,
                              :receiving_user_id => params[:format],
                                :confirmed => false,
                                  :status => "Pending"}
    @relationship = Relationship.new(relationship_params)
    @relationship.save
    params[:relationship] = {:requesting_user_id => params[:format],
                              :receiving_user_id => current_user.id,
                                :confirmed => false,
                                  :status => "Requested"}
    @relationship = Relationship.new(relationship_params)
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
    @incoming_relationship.update_all(status: "Confirmed")
    @outgoing_relationship.update_all(status: "Confirmed")
    redirect_to user_relationships_path, notice: 'Friendship confirmed!'
  end

  # DELETE /relationships/1
  def destroy
    @relationship.destroy
    redirect_to relationships_url, notice: 'Relationship was successfully destroyed.'
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @outgoing_relationship = Relationship.where(:requesting_user_id => current_user.id, :receiving_user_id => params[:id])
      @incoming_relationship = Relationship.where(:requesting_user_id => params[:id], :receiving_user_id => current_user.id)
    end

    # Only allow a trusted parameter "white list" through.
    def relationship_params
      params.require(:relationship).permit(:requesting_user_id,:receiving_user_id,:confirmed,:status)
    end
end
