require_relative 'spec_helper'

describe 'Application Container' do
  describe file('/etc/alpine-release') do
    its(:content) { is_expected.to match(/3.8.2/) }
  end

  describe 'node' do
    describe command('node --version') do
      its(:stdout) { is_expected.to match(/11.6/) }
    end

    describe process('node') do
      it { is_expected.to be_running }
      its(:args) { is_expected.to contain('app.js') }
      its(:user) { is_expected.to eq('runner') }
    end

    describe 'listens to correct port' do
      it { wait_for(port(3000)).to be_listening.with('tcp') }
    end
  end

  describe file('app.js') do
    it { is_expected.to be_file }
  end
end
