require "hatena_bookmark_client_for_ruby/version"
require "oauth"
require "crack"

module HatenaBookmarkClientForRuby
  class Bookmark
    def initialize(params)
      consumer = OAuth::Consumer.new(
        params[:consumer_key],
        params[:consumer_secret],
      )

      @access_token = OAuth::AccessToken.new(
        consumer,
        params[:request_token],
        params[:request_secret]
      )
    end

    def create(params)
      response = @access_token.post("http://api.b.hatena.ne.jp/1/my/bookmark", params)
    end

    def delete(url)
      encoded_url = CGI::escape(url)
      response = @access_token.delete("http://api.b.hatena.ne.jp/1/my/bookmark?url=#{url}")
    end

    def get(url)
      encoded_url = CGI::escape(url)
      response = @access_token.get("http://api.b.hatena.ne.jp/1/my/bookmark?url=#{url}")
    end
  end

  class Error < StandardError
  end

  # Your code goes here...
end
