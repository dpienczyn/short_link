require 'swagger_helper'

RSpec.describe 'api/v1/links', type: :request do
  let!(:token) { Knock::AuthToken.new(payload: { sub: create(:user).id }).token }
  let!(:Authorization) { "Bearer #{token}" }
  let!(:link) { create(:link) }

  let(:params) do
    {
      link: {
        url: Faker::Internet.unique.url
      }
    }
  end

  path '/api/v1/links' do
    get('list links') do
      tags 'Links'
      consumes 'application/json'

      response(200, 'successful') do
        run_test!
      end
    end

    post('create link') do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :params, in: :body, schema: {
        oneOf: [
          { '$ref' => '#/components/schemas/link' }
        ]
      }

      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/api/v1/links/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show link') do
      response(200, 'successful') do
        let(:id) { link.id }

        run_test!
      end
    end

    put('update link') do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :params, in: :body, schema: {
        oneOf: [
          { '$ref' => '#/components/schemas/link' }
        ]
      }

      response(200, 'successful') do
        let(:id) { link.id }

        run_test!
      end
    end

    delete('delete link') do
      response(204, 'successful') do
        let(:id) { link.id }

        run_test!
      end
    end
  end
end
