require 'test_helper'

class GemstoneStoriesTest < ActionDispatch::IntegrationTest

  setup { @gemstone = Gemstone.create!(name: 'Test Gem') }

  test "Returns list of gemstones as json" do
    # scenario "API can respond with json" do
      #given API, when I request for gemstones
      get '/gemstones', {}, { Accept: Mime::JSON }

      #then I should get a valid response
      assert_equal 200, response.status
      assert_equal Mime::JSON, response.content_type
      assert json(response.body)[:gemstones].includes { |stone| stone[:name] == 'Test Gem' }
    # end
  end

  test "Can create new gemstones by posting to /gemstones" do
    post '/gemstones',
    {gemstone: {
      name: 'Blue Diamond', price: '32.32', description: 'Blue shimmer like the sun off the ocean'}
      }.to_json,
      { Accept: Mime::JSON, content_type: Mime::JSON.to_s}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    newGem = json(response.body)
    assert_equal newGem_url(newGem[:id], response.location)
  end

  test "API responds with 422 if inproper input" do
    post '/gemstones',
      {gemstone: {
      name: nil, price: '4.04', description: 'shimmers like the void of space'}
      }.to_json,
      { Accept: Mime::JSON, content_type: Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type

  end

  test "Can edit new gemstones by posting to /gemstones" do

    patch '/gemstone/#{@gemstone.id}',
    {gemstone: {
      name: 'Blue Diamond', price: '32.32', description: 'Blue shimmer like the sun off the ocean'}
      }.to_json,
      { accept: Mime::JSON, content_type: Mime::JSON.to_s}

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test "API responds with 422 if inproper input to PATCH" do

    patch '/gemstone/#{@gemstone.id}',
      {gemstone: {
      name: nil, price: '4.04', description: 'shimmers like the void of space'}
      }.to_json,
      { Accept: Mime::JSON, content_type: Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type

  end

  test "Can delete gemstones by DELETE method request to /gemstones" do

    delete '/gemstone/#{@gemstone.id}'

    assert_equal 204, response.status
  end
end

