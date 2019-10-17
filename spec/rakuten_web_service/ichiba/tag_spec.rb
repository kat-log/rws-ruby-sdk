require 'spec_helper'

describe RakutenWebService::Ichiba::Tag do
  let(:params) do
    { 'tagId' => 100,
      'tagName' => 'SS',
      'parentTagId' => 1 }
  end
  let(:tag) { RakutenWebService::Ichiba::Tag.new(params) }

  describe '.new' do
    specify 'returned object should have methods to fetch values' do
      expect(tag.id).to eq(100)
      expect(tag.name).to eq('SS')
      expect(tag['parentTagId']).to eq(1)
    end
  end

  describe '#search' do
    specify 'it calls Ichiba::Item#search with its tag id' do
      expect(RWS::Ichiba::Item).to receive(:search).with({tagId: params['tagId']}).and_return([])

      tag.search
    end
  end
end
