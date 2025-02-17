# frozen_string_literal: true

require 'rails_helper'

describe Rails do
  describe 'truth' do
    it 'depends on your perspective' do
      truthy = [true, 'true', 1, '1', 't', 'T', 'yes', 'YES', 'y', 'Y'].sample
      expect(truthy).to be_truthy
    end
  end
end
