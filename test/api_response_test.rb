# class APIResponseTest < ActionDispatch::IntegrationTest

#   #feature "API should respond with appropriate formatting" do
#     scenario "API can respond with json" do
#       get '/products', {}, {'Accept' => Mime::JSON}
#       assert_equal 200, response.status
#       assert_equal Mime::JSON, response.format
#     end

#     scenario "API can respond with xml" do
#       get '/products', {}, {'Accept' => Mime::XML}
#       assert_equal 200, response.status
#       assert_equal Mime::XML, response.format
#     end
#   #end
# end
