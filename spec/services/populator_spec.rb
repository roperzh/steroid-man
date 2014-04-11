require File.expand_path(File.join("spec/spec_helper"))

describe Populator do

  describe "populate" do
    context "given a tool to parse groff files and a tool to index files" do

      let(:client)        { Elasticsearch::Client.new }
      let(:indexer)       { ScratchPad.new(client: client, store: true) }
      let(:groff_parser)  {
        ScratchPad.new(apply_to_all: [1,2,3])
      }

      it "indexes relevant data from all files in a specific directory" do
        Populator.populate(groff_parser, indexer)

        groff_parser.recorded.must_include :apply_to_all
      end
    end
  end
end
