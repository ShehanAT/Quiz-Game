class CollectionController < ApplicationController


    def new_collection 
        collectionName = params[:name]
        collectionCategory = params[:category]
        collectionTotalQuizzes = params[:total_quizzes]
        @collection = Collection.create(:name => collectionName, :category => collectionCategory, :total_quizzes => collectionTotalQuizzes)
        if @collection.save
            puts "Collection was saved"
        else 
            puts "Collection was not saved"
        end 
        render "/collection/new_collection"
    end 

    def show_collection_by_id
        collectionId = params[:id]
        @collection = Collection.find(collectionId)
        @quizzesInCollection = Quiz.where(collection_id: Collection.pluck(:id))
        render "collection/show_collection"
    end
    
    def delete_collection_by_id
        collectionId = params[:id]
        @collection = Collection.find(collectionId)
        if @collection.delete 
            puts "Collection was deleted"
        else 
            puts "Collection was not deleted"
        end 
    end 

    def update_collection_by_id  
        collectionId = params[:id]
        updateField = params[:update]
        updateValue = params[:newValue]
        @collection = Collection.find(collectionId)
        @quizzesInCollection = Quiz.where(collection_id: Collection.pluck(:id))
        if @collection[updateField] = updateValue
            puts "Collection was updated"
        else 
            puts "Collection was not updated"
        end 
        render "collection/show_collection"
    end 
end
