module Members
  class RelationshipsController < ApplicationController
    def create
      @relation = Members::Relationship.create(relation_params)
      if @relation.save!
        redirect_to @relation.relationer, notice: "Relationship saved successfully"
      else
        render :new
      end
    end

    private
    def relation_params
      params.require(:members_relationship).permit(:relationer_id, :relationee_id, :relationship_type)
    end
  end
end
