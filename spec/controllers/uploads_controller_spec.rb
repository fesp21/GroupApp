require 'spec_helper'

describe UploadsController do

  def mock_upload(stubs={})
    @mock_upload ||= mock_model(Upload, stubs)
  end
end
