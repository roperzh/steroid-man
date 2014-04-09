require "spec_helper"

describe ManIndexer do

  let(:indexer) { ManIndexer.new(client, "test_index") }
  let(:client)  { ScratchPad.new(indices: ScratchPad.new(exists: false)) }

  describe "#store" do
    context "given a supplied index name" do

      it "stores entry information" do
        indexer.store({ info: "sample_document" })

        client.recorded.must_include(:index)
      end
    end
  end

  context "given no existing index" do

    it "creates a new index, and stores entry information" do
      indexer.store({ info: "sample_document" })

      client.indices.recorded.must_include(:create)
    end
  end

end
