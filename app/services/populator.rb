# This class reads the man pages present in the current machine and stores
# the collected information in elasticsearch

class Populator

  # Iterates over all the indexable documents in a given directory
  # and stores the collected information in elasticsearch
  #
  # @params groff_engine [GroffParser::Engine] an instance of the engine
  #
  # @params indexer [ManIndexer] an instance of the indexer

  def self.populate(groff_engine, indexer)
    groff_engine.apply_to_all zipped: true do |document|
      begin
        indexer.store(data_for document)
      rescue => e
        puts e
      end
    end
  end

  private

  # Parse the collected data, and returns an indexable hash
  #
  # @params document [GroffParser::Document] the document to be parsed
  #
  # @return [Hash] hash representation of the document

  def self.data_for(document)
    {
      name:         document.formatted_section("NAME", :utf8),
      synopsis:     document.formatted_section("SYNOPSIS", :utf8),
      description:  document.formatted_section("DESCRIPTION", :utf8),
      examples:     document.formatted_section("EXAMPLES", :utf8),
      author:       document.formatted_section("AUTHOR", :utf8),
      full_content: document.formatted_content(:html),
      slug:         Formatter.slugfy(document.formatted_section("NAME", :utf8))
    }
  end
end
