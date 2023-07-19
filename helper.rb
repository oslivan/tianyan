module Helper
  DEF_HEADER = { 'Content-Type' => 'application/json' }.freeze

  def authorize!
    halt(403) unless env['HTTP_X_TOKEN']

    @current_user = User.from_token(env['HTTP_X_TOKEN'])
  end

  def render_json(status, data)
    headers DEF_HEADER
    response.status = status
    response.body = data.to_json
    halt response
  end

  def render_file(file, type, filename)
    send_file file, :type => type, :filename => CGI.escape(filename), :disposition => :attachment
  end

  def decode_request_body!
    return unless request.content_type&.match?(/application\/json/)

    request.body.rewind
    data = JSON.parse(request.body.read, symbolize_names: true)
    params.merge!(data)
  end
end