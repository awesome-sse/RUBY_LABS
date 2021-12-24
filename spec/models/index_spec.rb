# frozen_string_literal: true

require 'rails_helper'
require 'json'

# Что за expect().to receive - см в link_request_spec.

RSpec.describe Index, type: :model do
  # let! отличается от let тем, что версия в ! вызывается перед каждым тестом принудительно,
  # а let ленив и вызывается только в том случае, если явно вызван. Поэтому для генерации
  # записи и проверки того, что slug уникален, нужно использовать let!, иначе перед тестом
  # в БД ничего не попадет.

  let!(:arr12) { Index.create array: '1 2', result: '[]', error: false, longest_one: '[]' }
  let!(:arr1266) { Index.create array: '1 2 6 6', result: '[[[6], [2]], [[6, 6], [2, 3]], [[6], [3]]]', error: false, longest_one: '[[6, 6], [2, 3]]' }

  it 'should not create duplicated array' do
    expect(Index.create(array: '1 2', result: '[]', error: false, longest_one: '[]').valid?).to be(false)
  end

    describe 'find_arrays' do
        it 'should find existing array' do
            expect(Index.find_by(array: '1 2').valid?).to be(true)
        end

        it 'should not find existing array' do
            expect(Index.find_by(array: '1 2 3').nil?).to be(true)
        end
    end

    describe 'get_valid_results' do
        it 'should get result' do
            res = [[[6], [2]], [[6, 6], [2, 3]], [[6], [3]]]
            expect(JSON.parse(Index.find_by(array: '1 2 6 6').result)).to eql(res)
        end

        it 'should get longest_one' do
            lo = [[6, 6], [2, 3]]
            expect(JSON.parse(Index.find_by(array: '1 2 6 6').longest_one)).to eql(lo)
        end
    end

end