require 'sinatra/base'
require_relative 'helper'

class API < Sinatra::Base
  helpers Helper

  set :show_exceptions, false

  before do
    decode_request_body!
  end

  # @param keyword 关键词；如公司名称、公司id、注册号或社会统一信用代码
  get '/search' do
    if ty = Tianyan.search(params[:keyword])
      render_json 200, ty.as_json
    else
      render_json(404, { code: :not_found, message: '没有找到对应的企业' })
    end
  end

  error do
    render_json(400, { code: :app_error, message: env['sinatra.error'].message })
  end

  error 403 do
    render_json(403, { code: :forbidden, message: '未授权访问' })
  end
end