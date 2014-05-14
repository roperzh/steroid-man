# This class aims to be a wrapper between the elasticsearch gem, making
# some actions a little bit verbose, and avoid repetition

class ManIndexer

  attr_accessor :index_name, :client

  def initialize(client, index_name)
    @client       = client
    @index_name   = index_name
  end

  # Stores a single chunk of data (commonly a hash) in elasticsearch
  #
  # @example
  #   indexer = Indexer.new client, "sample_index"
  #   indexer.store({ sample: "data" })
  #   # => Stores the passed hash in sample_index
  #
  # @param data [Hash] data to be stored
  #
  # @return [Hash] hash with the result of the transaction

  def store(data)
    prepare

    @client.index(
      index: index_name, type: "document", body: data
    )
  end

  # Creates an index with @index_name, and set the mappings
  # only if the index does not exist

  def prepare
    return if @client.indices.exists index: index_name

    @client.indices.create index: index_name,
      body: {
        mappings: {
          document: {
            properties: {
              name:         { type: "string", analyzer: "whitespace" },
              synopsis:     { type: "string", analyzer: "standard" },
              description:  { type: "string", analyzer: "snowball" },
              examples:     { type: "string", analyzer: "standard" },
              author:       { type: "string", analyzer: "whitespace" },
              full_content: { type: "string", analyzer: "snowball" },
              slug:         { type: "string", analyzer: "keyword" }
            }
          }
        }
      }
  end
end
