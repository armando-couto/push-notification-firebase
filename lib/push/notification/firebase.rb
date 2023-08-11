require "push/notification/firebase/version"

require 'net/http'
require 'jwt'
require 'json'
require 'openssl'

module Push
  module Notification
    module Firebase
      class Error < StandardError; end

      CREDENTIALS = JSON.parse(File.read("credentials.json"))
      PRIVATE_KEY = OpenSSL::PKey::RSA.new CREDENTIALS["private_key"]

      def processing message, logger
        # Construindo a mensagem
        message_payload = {
          "message": {
            "token": message["token"],
            "notification": {
              "title": message["title"],
              "body": message["message"]
            }
          }
        }

        uri = URI.parse("https://fcm.googleapis.com/v1/projects/fixpayapp-d3d68/messages:send")
        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true
        req = Net::HTTP::Post.new(uri.path)
        req["Content-Type"] = "application/json"
        req["Authorization"] = "Bearer #{generate_access_token}"
        req.body = message_payload.to_json

        https.request(req)
        logger.info req.body
      end

      private

      def self.generate_access_token
        uri = URI.parse(CREDENTIALS["token_uri"])
        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true
        req = Net::HTTP::Post.new(uri.path)
        req['Cache-Control'] = "no-store"
        req.set_form_data({
                            grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
                            assertion: generate_jwt_assertion
                          })

        resp = JSON.parse(https.request(req).body)
        resp["access_token"]
      end

      def self.generate_jwt_assertion
        now_seconds = Time.now.to_i
        payload = { iss: CREDENTIALS["client_email"],
                    aud: CREDENTIALS["token_uri"],
                    iat: now_seconds,
                    exp: now_seconds + (60 * 60),
                    scope: 'https://www.googleapis.com/auth/firebase.messaging',
        }
        JWT.encode payload, PRIVATE_KEY, "RS256"
      end
    end
  end
end
