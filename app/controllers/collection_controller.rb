class CollectionController < ApplicationController


    def new_collection 
        collectionName = params[:name]
        collectionCategory = params[:category]
        collectionTotalQuizzes = params[:total_quizzes]
        @collection = Collection.create(:name => collectionName, :category => collectionCategory, :total_quizzes => collectionTotalQuizzes)
        if @collection.save
            Rails.logger.info "Collection was saved"
        else 
            Rails.logger.info "Collection was not saved"
        end 
        render "/collection/new_collection"
    end 

    def show_collection_by_id
        @collection = Collection.find(params[:id])
        @quizzesInCollection = Quiz.where(collection_id: Collection.pluck(:id))
        render "collection/show_collection"
    end
    
    def delete_collection_by_id
        @collection = Collection.find(params[:id])
        if @collection.delete 
            Rails.logger.info "Collection was deleted"
        else 
            Rails.logger.info "Collection was not deleted"
        end 
    end 

    def update_collection_by_id  
        updateField = params[:update]
        updateValue = params[:newValue]
        @collection = Collection.find(params[:id])
        @quizzesInCollection = Quiz.where(collection_id: Collection.pluck(:id))
        if @collection[updateField] = updateValue
            Rails.logger.info "Collection was updated"
        else 
            Rails.logger.info "Collection was not updated"
        end 
        render "collection/show_collection"
    end 
end
