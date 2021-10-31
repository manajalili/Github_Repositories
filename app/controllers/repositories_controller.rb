class RepositoriesController < ApplicationController
  require 'open-uri'

  def new; end

  def repo
    @repo = params[:repo]
    @user = params[:user]
    @result = api(@user, @repo)
  end

  private

  def api(user, repo)
    begin
      response = URI.open("https://api.github.com/repos/#{user}/#{repo}")
    rescue
    else
      JSON.parse(response.read)
    end
  end
end
