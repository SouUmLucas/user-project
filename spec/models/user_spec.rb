require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to :id }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :birthdate }
  it { is_expected.to respond_to :phone_number }
  it { is_expected.to_not allow_value("lucas.com.br").for(:email) }
end
