class Api::V1::V1Base < Api::ApiBase
  include Api::V1::Concerns::Response
  include Api::V1::Concerns::ExceptionHandler
end