# Adapted from https://medium.com/@umerqaisar/the-ultimate-guide-to-rspec-testing-in-rails-models-and-controllers-3acd2a67f3cd
require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { FactoryBot.build(:player) }

  context 'Should validate' do
    it 'with username, display name, flag, email, and password' do
      expect(player).to be_valid
    end

    it 'when display name is not present' do
      player.display_name = nil
      expect(player).to be_valid
    end

    it 'when use_display_name is not present' do
      player.use_display_name = nil
      expect(player).to be_valid
    end
  end

  context 'Should not be valid' do
    it 'when username is not present' do
      player.username = nil
      expect(player).not_to be_valid
    end

    it 'when email is not present' do
      player.email = nil
      expect(player).not_to be_valid
    end

    it 'when password is not present' do
      player.password = nil
      expect(player).not_to be_valid
    end
  end
end