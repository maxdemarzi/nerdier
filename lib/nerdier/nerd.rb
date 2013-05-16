module Nerdier
  
  class Nerd
    USER_AGENT = "NERD ruby library #{VERSION}"

    attr_accessor :url, :api, :timeout

    def initialize(api = ENV['NERD_API'], url = 'http://nerd.eurecom.fr', timeout = 1200)
      @client = Client.http_client
      @client.connect_timeout = timeout + 10
      @url = url
      @timeout = timeout
      @options = {:key => api}
      @headers = {:"content-type" => "application/x-www-form-urlencoded",
                  :accept => "application/json",
                  :"user-agent" => USER_AGENT}
    end

    def extract(uri = "", extractor = 'combined', timeout = @timeout)
      # Submit Document
      doc = Oj.load(@client.post_content(@url + "/api/document", {:body => @options.merge({:uri => uri}) , :headers => @headers}))
      doc_id = doc["idDocument"]
      
      # Annotate Document
      annotated_options = @options.merge({"extractor" => extractor, "idDocument" => doc_id, :timeout => @timeout})
      annotated_doc = Oj.load(@client.post_content(@url + "/api/annotation", {:body => annotated_options, :headers =>  @headers}))
      annotation_id = annotated_doc["idAnnotation"]
      
      # Extract from Document
      extract_options = @options.merge(:idAnnotation => annotation_id) #.map{|k,v| "#{k}=#{v}"}.join("&")
      Oj.load(@client.get_content(@url + "/api/entity", {:query => extract_options, :headers => @headers}))
    end
    
    
  end
end
