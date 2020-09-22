class UsersController < ApplicationController
    def test
        render json: { message: 'Hello World' }
    end
end
