require 'generator_spec'
require 'generators/wor/requests/install_generator'

describe Wor::Requests::Generators::InstallGenerator, type: :generator do
  context 'generating the initializer ' do
    destination File.expand_path('../../../../tmp', __FILE__)

    before(:all) do
      prepare_destination
      run_generator
    end

    # rubocop:disable Style/BlockDelimiters
    it 'generates the correct structure for initializer' do
      expect(destination_root).to(have_structure {
        no_file 'wor_requests.rb'
        directory 'config' do
          no_file 'wor_requests.rb'
          directory 'initializers' do
            file 'wor_requests.rb' do
              contains 'Wor::Requests.configure do'
            end
          end
        end
      })
    end
    # rubocop:enable Style/BlockDelimiters
  end
end
