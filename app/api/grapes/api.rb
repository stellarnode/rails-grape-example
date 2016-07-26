module Grapes

  class API < Grape::API

    # set up format and base path: /api/v1
    version 'v1', using: :path
    prefix :api
    format :json
    rescue_from :all # gracefully handle errors


    resource :posts do

      # /api/v1/posts
      desc 'Returns all posts'
      get do
        Post.all
      end

      # /api/v1/posts/:id
      desc 'Returns post by id'
      params do
        requires :id, type: Integer, desc: 'Post id.'
      end
      get ':id' do
        Post.find(params[:id])
      end

      # /api/v1/posts
      desc 'Creates a post'
      params do
        requires :title, type: String, desc: 'Title'
        requires :body, type: String, desc: 'Body'
      end
      post do
        Post.create!({
          title: params[:title],
          body: params[:body]
        })
      end

      # /api/v1/posts/:id
      desc 'Updates a post'
      params do
        requires :id, type: String, desc: 'Post ID.'
        requires :title, type: String, desc: 'Title'
        requires :body, type: String, desc: 'Body'
      end
      put ':id' do
        Post.find(params[:id]).update({
          title: params[:title],
          text: params[:body]
        })
      end

      # /api/v1/posts/:id
      desc 'Deletes a post'
      params do
        requires :id, type: String, desc: 'Post ID.'
      end
      delete ':id' do
        Post.find(params[:id]).destroy
      end

    end

  end

end
