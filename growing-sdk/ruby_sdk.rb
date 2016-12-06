# use snappy to compress data 
# install snappy in Mac
# $ brew install snappy # snappy library from Google
# $ CPPFLAGS="-I/usr/local/include -L/usr/local/lib" pip install python-snappy

require 'uri'
require 'net/http'
require 'net/https'
require 'json'
require 'snappy' # gem install snappy -> snappy-0.0.15.gem

@toSend = [{
"tm" => 1480042727121,
"stm" => 1480042728943,
    "cs1" => "user:526",
    "p" => "/v2/projects/yYo1XPl1/charts",
    "s" => "bb9aa471-3bc9-455b-b3a1-eeb9e0e9a0e3",
    "u" => "7328beea-ee89-43a0-86cb-48879e90a67d",
    "ai" => "0a1b4118dd954ec3bcc69da5138bdb96",
    "t" => "cstm",
    "d" => "gta.growingio.com",
    "n" => "create_chart",
    "e" => {
        "account_id" => "0a1b4118dd954ec3bcc69da5138bdb96",
        "chart_dimension_count" => 12,
        "chart_id" => 9999,
        "chart_metric_count" => 1,
        "chart_name" => "ruby dim test",
        "chart_type" => "line"
    }
}].to_json.to_s

@compressedData = Snappy.deflate(@toSend) # need to compress data !
clientId = '7f8it37dxdt91x4n5cvuvccc1cgaqe22'
baseUrl = "https://api.growingio.com/custom"
ai = "0a1b4118dd954ec3bcc69da5138bdb96"
uri = URI.parse("#{baseUrl}/#{ai}/events")
https = Net::HTTP.new(uri.host,uri.port)
https.use_ssl = true
req = Net::HTTP::Post.new(uri.path)
req['Content-Type'] = 'application/json'
req['X-Client-Id'] = clientId
req.body = "#{@compressedData}"
res = https.request(req)
puts "Response #{res.code} #{res.message}: #{res.body}"
