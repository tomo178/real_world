class ArticleSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :body
end