class LoginController < ApplicationController
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def wechat_params
    {
      appid: appId  ENV[],
      secret: appSecret,
      js_code: params[:code],
      grant_type: "authorization_code"
    }
  end
end
