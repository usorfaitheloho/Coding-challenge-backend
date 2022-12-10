require 'swagger_helper'

RSpec.describe 'api/v1/sectors', type: :request do
  path '/api/v1/sectors' do
    get('list sectors') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update sector') do
      response(200, 'Sector added successfully') do
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :sector_name, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
          },
          required: %w[name]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    # put('update doctor') do
    #   response(200, 'Doctor added successfully') do
    #     let(:id) { '123' }

    #     consumes 'application/json'
    #     parameter name: :doctor, in: :body, schema: {
    #       type: :object,
    #       properties: {
    #         name: { type: :string },
    #         specialization: { type: :string },
    #         charges: { type: :integer },
    #         photo: { type: :string }
    #       },
    #       required: %w[name specialization charges photo]
    #     }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end

    # delete('delete doctor') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end
end
