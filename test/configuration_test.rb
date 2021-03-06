require_relative 'test_helper'

module MeducationSDK
  class ConfigurationTest < Minitest::Test

    def setup
      super
      MeducationSDK.instance_variable_set("@config", nil)
    end

    def test_obtaining_singletion
      refute MeducationSDK.config.nil?
    end

    def test_block_syntax
      test_key = "foobar-123-access"
      MeducationSDK.config do |config|
        config.access_id = test_key
      end
      assert_equal test_key, Loquor.config.access_id
    end

    def test_endpoint_is_set_correctly
      Configuration.new
      assert_equal "http://spi.meducation.net", Loquor.config.endpoint
    end

    def test_retry_404s_is_set_correctly
      Configuration.new
      assert_equal true, Loquor.config.retry_404s
    end

    def test_access_id_proxies_to_loquor
      access_id = "test-access-id"
      MeducationSDK.config.access_id = access_id
      assert_equal access_id, Loquor.config.access_id
    end

    def test_secret_key_proxies_to_loquor
      key = "test-secret-key"
      MeducationSDK.config.secret_key = key
      assert_equal key, Loquor.config.secret_key
    end

    def test_cache_proxies_to_loquor
      cache = mock()
      MeducationSDK.config.cache = cache
      assert_equal cache, Loquor.config.cache
    end
  end
end
