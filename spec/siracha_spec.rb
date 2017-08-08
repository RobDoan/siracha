require "spec_helper"
RSpec.describe 'New Project' do
  before(:all) do
    drop_dummy_database
    remove_project_directory
  end

  context "With devise and rubocop" do
    before do
      allow(Thor::LineEditor).to receive(:readline).with(/Do you want to add rubocop\?/, any_args).and_return('y')
      allow(Thor::LineEditor).to receive(:readline).with(/Do you want to install devise\?/, any_args).and_return('y')
      allow(Thor::LineEditor).to receive(:readline).with(/What is modal name\[user\]\?/, any_args).and_return('user')
      run_siracha
    end
    it 'add rubocop files' do
      expect(File).to exist("#{project_path}/.rubocop.yml")
    end
  end

end
