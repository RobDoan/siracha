require 'byebug'
require "spec_helper"
RSpec.describe 'New Project' do
  ran_siracha = false
  before(:all) do
    drop_dummy_database
    remove_project_directory
  end

  context "With devise and rubocop" do
    before do
      allow(Thor::LineEditor).to receive(:readline).with(/Do you want to add rubocop\?/, any_args).and_return('y')
      allow(Thor::LineEditor).to receive(:readline).with(/Do you want to install devise\?/, any_args).and_return('y')
      allow(Thor::LineEditor).to receive(:readline).with(/What is modal name\[user\]\?/, any_args).and_return('user')
      unless ran_siracha
        run_siracha
        ran_siracha = true
      end
    end
    it 'add rubocop files' do
      expect(File).to be_exist("#{project_path}/.rubocop.yml")
    end

    it 'should not have test folder' do
      expect(Dir).not_to be_exist("#{project_path}/test")
    end

  end

end
