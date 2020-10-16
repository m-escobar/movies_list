require 'rails_helper'

RSpec.describe 'Movie', type: :request do
  it 'should responde to request' do
    get '/'
    expect(response).to have_http_status(:ok)
  end

  it 'should have index' do
    get '/'
    expect(response).to render_template(:index)
  end
end
