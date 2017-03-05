class TestController < ApplicationController
  def show
    render plain: 'hello!'
  end
end
